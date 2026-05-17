#!/usr/bin/env python3
"""
Resume PDF extractor for resume-forge skill.
Extracts text from a resume PDF with layout preservation.
Falls back gracefully if tools are missing.

Usage: python3 extract_resume.py <path-to-resume.pdf>
"""

import sys
import os
import subprocess
import tempfile

def extract_with_pdftotext(pdf_path):
    """Best quality: preserves layout using pdftotext -layout"""
    try:
        result = subprocess.run(
            ["pdftotext", "-layout", pdf_path, "-"],
            capture_output=True, text=True, timeout=30
        )
        if result.returncode == 0 and result.stdout.strip():
            return result.stdout.strip(), "pdftotext"
    except (FileNotFoundError, subprocess.TimeoutExpired):
        pass
    return None, None

def extract_with_pdfplumber(pdf_path):
    """Fallback: pdfplumber with layout-aware extraction"""
    try:
        import pdfplumber
        text_parts = []
        with pdfplumber.open(pdf_path) as pdf:
            for page in pdf.pages:
                text = page.extract_text(layout=True)
                if text:
                    text_parts.append(text)
        full_text = "\n\n".join(text_parts).strip()
        if full_text:
            return full_text, "pdfplumber"
    except ImportError:
        pass
    except Exception:
        pass
    return None, None

def extract_with_pypdf(pdf_path):
    """Last resort: pypdf basic extraction"""
    try:
        from pypdf import PdfReader
        reader = PdfReader(pdf_path)
        text_parts = []
        for page in reader.pages:
            text = page.extract_text()
            if text:
                text_parts.append(text)
        full_text = "\n\n".join(text_parts).strip()
        if full_text:
            return full_text, "pypdf"
    except ImportError:
        pass
    except Exception:
        pass
    return None, None

def rasterize_page(pdf_path, page_num=1):
    """Rasterize first page for visual inspection when text extraction fails"""
    try:
        out_prefix = os.path.join(tempfile.gettempdir(), "resume_page")
        result = subprocess.run(
            ["pdftoppm", "-jpeg", "-r", "150",
             "-f", str(page_num), "-l", str(page_num),
             pdf_path, out_prefix],
            capture_output=True, timeout=30
        )
        if result.returncode == 0:
            # Find the output file
            import glob
            files = glob.glob(f"{out_prefix}*.jpg")
            if files:
                return sorted(files)[0]
    except (FileNotFoundError, subprocess.TimeoutExpired):
        pass
    return None

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 extract_resume.py <path-to-resume.pdf>", file=sys.stderr)
        sys.exit(1)

    pdf_path = sys.argv[1]

    if not os.path.exists(pdf_path):
        print(f"Error: File not found: {pdf_path}", file=sys.stderr)
        sys.exit(1)

    if not pdf_path.lower().endswith(".pdf"):
        print(f"Error: File does not appear to be a PDF: {pdf_path}", file=sys.stderr)
        sys.exit(1)

    # Try extractors in order of quality
    text, method = extract_with_pdftotext(pdf_path)

    if not text:
        text, method = extract_with_pdfplumber(pdf_path)

    if not text:
        text, method = extract_with_pypdf(pdf_path)

    if text:
        print(f"[Extracted via {method}]\n")
        print(text)
    else:
        # Text extraction failed entirely — likely a scanned PDF
        print("[WARNING] Text extraction failed. This PDF may be scanned or image-based.")
        print("[ACTION] Rasterizing first page for visual analysis...\n")

        img_path = rasterize_page(pdf_path)
        if img_path:
            print(f"[PAGE IMAGE SAVED] Read this file for visual analysis: {img_path}")
        else:
            print("[ERROR] Could not extract text or rasterize. Please ensure poppler-utils is installed:")
            print("  macOS:  brew install poppler")
            print("  Ubuntu: sudo apt install poppler-utils")
            sys.exit(1)

if __name__ == "__main__":
    main()