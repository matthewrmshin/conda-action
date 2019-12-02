# Conda-Action

This action creates and activates a Conda environment `myenv` with the
project's requirement file. You can run your logic in the Conda environment for
subsequent steps in the job.

## Example usage

```yaml
jobs:
  build-and-run:
    steps:
    - uses: actions/checkout@v1
    - name: Update Conda environment with "requirements.yml"
      uses: matthewrmshin/conda-action@master
      with:
        args: conda env update -n myenv
    - name: Test with environment
      uses: matthewrmshin/conda-action@master
      with:
        args: pytest
```
