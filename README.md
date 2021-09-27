# LOGIN Action IBMCloud

This action is to login into AWS Cloud

## Entradas

### `aws_access_key_id`

**Obligatorio** aws_access_key_id to use for login

### `region`

**Obligatorio** Region to connect to

### `aws_secret_access_key`

**Obligatorio** aws_secret_access_key


## Ejemplo de uso

docker run -ti awslogin my-region my-aws_access_key_id my-aws_secret_access_key


```yaml
# File: .github/workflows/workflow.yml
on: [push]

name: example

jobs:

  devflow:
    runs-on: ubuntu-latest
    steps:
    
    - uses: mnevadom/awslogin@v1
      with:
        region: "eu-de"
        aws_access_key_id: ${{ secrets.AWS_KEY }}
        aws_secret_access_key: ${{ secrets.AWS_SECCRET_KEY }}
        
```
