<p>
  <a href="https://github.com/matthewrmshin/conda-action/actions"><img alt="GitHub Actions status" src="https://github.com/matthewrmshin/conda-action/workflows/Test/badge.svg"></a>
</p>

# Conda-Action

This action runs a container from Ubuntu with Miniconda3 installed. It creates
and activates a Conda environment `--prefix="${GITHUB_WORKSPACE}/myenv"`. You
can update the environment with your project's requirement file, and run your
logic in the Conda environment for subsequent steps in the job.

## Example usage

```yaml
jobs:
  build-and-run:
    steps:
    - uses: actions/checkout@v1
    - name: Update Conda environment with "requirements.yml"
      uses: matthewrmshin/conda-action@v1
      with:
        args: conda env update -f ./requirements.yml
    - name: Run "pytest" with the Conda environment
      uses: matthewrmshin/conda-action@v1
      with:
        args: pytest
```
