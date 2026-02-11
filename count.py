from pathlib import Path

def count_files_per_dir(root_dir: str, output_txt: str, recursive: bool = False):
    """
    For each directory under root_dir, count files and write pairs like:
    ("0-2489" "0-1541" ...)
    
    - If recursive=False: counts only files directly in each directory.
    - If recursive=True: counts all files under each directory (including subdirs).
    """
    root = Path(root_dir)

    # Choose which directories to count
    dirs = sorted([p for p in root.iterdir() if p.is_dir()])

    ranges = []
    for d in dirs:
        if recursive:
            n_files = sum(1 for p in d.rglob("*") if p.is_file())
        else:
            n_files = sum(1 for p in d.iterdir() if p.is_file())

        # Convert count to "0-(count-1)" format; handle empty dirs safely
        if n_files == 0:
            ranges.append('"0--1"')   # or use '"0-0"' if you prefer
        else:
            ranges.append(f'"0-{n_files - 1}"')

    out = "(" + " ".join(ranges) + ")"

    Path(output_txt).write_text(out + "\n", encoding="utf-8")
    print(f"Wrote {len(ranges)} directories to {output_txt}")
    print(out)


if __name__ == "__main__":
    # Example usage:
    count_files_per_dir(
        root_dir="/store01/flynn/darun/uerc2023/data/public/",      # contains subfolders like dir1, dir2, ...
        output_txt="/users/darun/afs/Forensic-Iris-Image-Synthesis/count.txt",
        recursive=False                # set True if you want to include nested files too
    )

