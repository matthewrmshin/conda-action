# Conda-Action

This action creates and activates a Conda environment with the project's
requirement file, so you can run your logic in the correct Conda environment
in the current job.

## Example usage

```yaml
jobs:
  build-and-run:
    steps:
    - uses: actions/checkout@v1
    - name: Update Conda environment with "requirements.yml"
      uses: matthewrmshin/conda-action@master
      with:
        args: conda env update -n base
    - name: Test with environment
      uses: matthewrmshin/conda-action@master
      with:
        args: pytest
```
