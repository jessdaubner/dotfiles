# asdf-vm + direnv

## Background
[asdf](https://github.com/asdf-vm/asdf) uses a combination of plugins to support languages and a `.tool-versions` file in the local directory (inside a repo) or globally ($HOME) to pick what version of a tool to use.
It will shim the chosen versions into your PATH for you, so you get the right version of each language on a per-directory basis.
You will have to install the right plugins; they cannot be auto-installed.
Once you have plugins and `.tool-versions` in project repos, a simple `asdf install` from within the repo will install and shim the right version of the language and/or framework.

Direnv simplifies environment variables for projects by clearly defining them.
[asdf-direnv](https://github.com/asdf-community/asdf-direnv) plugin handles env setup.
Direnv also provides measurable performance benefits in daily use by speeding up the asdf shims, e.g. during package installs where the interpreter is invoked many times.

## Setup
1. [Follow their directions for your operating system.](https://asdf-vm.com/#/core-manage-asdf)
2. [Install asdf-direnv](https://github.com/asdf-community/asdf-direnv#setup):
   ```
   asdf plugin-add direnv
   asdf install direnv 2.23.1
   asdf global  direnv 2.23.1
   ```
3. [Configure asdf and direnv itegration](https://github.com/asdf-community/asdf-direnv#global-asdf-direnv-integration)
4. Install language plugins, as needed. Common plugins we use include Python and Terraform:
   ```bash
   asdf plugin-add python
   asdf plugin-add terraform
   ```

### Troubleshooting
* Ensure your path is looking in the correct place for asdf depending on how the install was done. Refer to documentation on asdf above for setting path to include asdf install location. You can run `echo $PATH` and `which asdf` to get some insight on how your shell is finding asdf.
* [Ensure .config/direnv/direnvrc file](https://github.com/asdf-community/asdf-direnv#global-asdf-direnv-integration) is setup to allow the `use asdf` line.
* [Ensure direnv hook is setup](https://github.com/asdf-community/asdf-direnv#setup) [acording to shell you are using](https://github.com/direnv/direnv/blob/master/docs/hook.md)


## How to use
Projects include a `.tool-versions` to tell asdf which versions of languages to use.
Repos will also include a `.envrc.sample` which you'll need to copy to to use.
```bash
cp .envrc.sample .envrc
asdf exec direnv allow
```

You may want to create a shell alias (`alias direnv='asdf exec direnv'`) if you don't like typing that whole mess.
You won't just be able to `direnv allow` because since the `.envrc` is currently rejected by direnv, you won't have any asdf managed programs in your path, including direnv itself.

You can add environmental variables to the `.envrc` as you need to for your project.
Add them like standard bash env vars: `export VAR=VALUE`.
Use `asdf install` to prepare your repo-specific language tooling.

Once you have allowed the `.envrc` file and you see direnv being active:
```bash
$ cd mastery/<your-project>
direnv: loading .envrc
direnv: using asdf
direnv: loading ~/.asdf/installs/direnv/2.23.1/env/266424240-637988107-1156974511-547257890
direnv: using asdf python 3.8.1
direnv: export +<YOUR-ENVS> +VIRTUAL_ENV ~PATH
```

### Project Configuration
* Configure the asdf language and versions you will use via `asdf local <language> <version>`
* Add the resulting .tool-versions file.
* Add the `.envrc` and `.direnv` to the repo's `.gitignore` to prevent committing secrets or your local language installs.
  * You can do this for your account globally too:
    ```bash
    git config --global core.excludesfile "~/.gitignore_global"
    echo '# Direnv stuff' >> ~/.gitignore_global
    echo '.direnv' >> ~/.gitignore_global
    echo '.envrc' >> ~/.gitignore_global
    ```
* Create a `.envrc.sample` as appropriate to your language:
  * Python:
    ```
    use asdf
    layout python
    ```
* Add standard bash `export VAR=VALUE` lines to the `.envrc.sample` as needed.

## Set or update what version a repo uses
```bash
asdf install <language> <version>
asdf local <language> <version>
git add .tool-versions
git commit -m "Switching to <language> <version>"
```
