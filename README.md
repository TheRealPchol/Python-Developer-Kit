# PyDK — Python Developer Kit

**PyDK** is a lightweight, blazing-fast Command Line Interface (CLI) tool designed to automate routine Python development tasks. It helps you manage virtual environments, handle dependencies completely offline, run your projects, clear workspace debris, and compile applications into standalone binary executables.

---

## Features

- **Instant Environments:** Create standardized `env/` virtual environments and auto-configure Git tracking in one command.
- **Pure Offline Mode:** Install core system tools (`apt`) and Python packages (`pip`) using pre-downloaded local sources without any internet connection.
- **Smart Launcher:** Automatically detect and run your project entry points (`main.py`, `app.py`, or Django `manage.py`).
- **One-Click Builder:** Bundle your script into a portable, standalone binary executable with automatic permission handling (`chmod +x`) and debris cleanup.
- **Global Deployment & Updates:** Easy system-wide installation via `curl` and frictionless self-updating directly from GitHub.

---

## Installation

You can install **PyDK** globally with a single command using `curl`:

```
curl -sSL https://github.com/TheRealPchol/Python-Developer-Kit/raw/refs/heads/main/install.sh | bash
```

Once installed, the `pydk` command becomes available globally across your system.

---

## Usage & Commands

The general syntax is simple:
```
pydk [command] [arguments]
```

### 1. Project Initialization

* **Create standard environment:**
  Creates a Python virtual environment (`env/`) in the current or target directory.
  ```
  pydk start_prj [path/to/dir]
  ```
* **Create environment with Git:**
  Creates an environment, creates/appends `env/` to `.gitignore`, and initializes a Git repository.
  ```
  pydk start_git_prj [path/to/dir]
  ```

### 2. Environment Management

* **Install standard Python development stack (Online):**
  Performs an automated system update and installs a complete developer setup via `apt` (Python, pip, venv, poetry, docker, linters, and compilers).
  ```
  pydk install
  ```
* **Install standard Python development stack (Offline):**
  Deploys the core developer stack and system tools from the local `sources/` directory.
  ```
  pydk offline_install
  ```
* **Install Python libraries (Offline Python wheels):**
  Installs over 100 essential developer, test, and GUI libraries (e.g., FastAPI, PyQt6, PyGame, PyInstaller) directly from `pip_sources/packages/` completely offline.
  ```
  pydk install_offline
  ```
* **Remove environment:**
  Safely attempts to deactivate the active environment, recursively purges `env/`, and deletes the respective `.gitignore` setup.
  ```
  pydk rem_prj [path/to/dir]
  ```

### 3. Execution & Workflow

* **Run the application:**
  Intelligently checks the current directory, targets the local environment interpreter, and runs your project using available entry points (`main.py`, `app.py`, or `manage.py runserver`).
  ```
  pydk run [additional_arguments]
  ```
* **Workspace Cleanup:**
  Recursively clears out all temporary caches (`__pycache__`, `.pytest_cache`, `.mypy_cache`), removes compiled bytecode (`*.pyc`), and deletes the `./temp/` directory.
  ```
  pydk clean
  ```

### 4. Compilation & Maintenance

* **Build standalone binary executable:**
  Compiles your application into a single, high-performance binary file using `PyInstaller`. It manages dependencies, strips build artifacts (`build/`, `*.spec`), forces execution permissions (`chmod +x`), and updates your `.gitignore`.
  ```
  pydk build [target_directory] [custom_output_name]
  ```
  *Example:* `pydk build . my_awesome_app` saves the standalone executable to `./dist/my_awesome_app`.

* **Self-Update:**
  Synchronizes your global `/opt/pydk` files with the latest updates from the official GitHub repository.
  ```
  pydk update
  ```

---

## Directory Structure

To support offline compilation and execution, ensure your local repository conforms to the following layout:

```
Python-Developer-Kit/
├── pip_sources/
│   └── packages/          # Pre-downloaded *.whl packages
├── sources/
│   ├── deb/               # Core system *.deb packages
│   └── tar.gz/            # Advanced tools with local install.sh scripts
├── install.sh             # Main installer script
├── LICENSE                # Open-source license
└── pydk                   # Main executable CLI engine
```

---

## License

This project is open-source software licensed under the terms of the **GNU Lesser General Public License (LGPL)**. For more details, please see the [LICENSE](LICENSE) file in the repository root.
