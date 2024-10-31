## Sobre

Desafio tecnico utilizando Robot Framework

## Techs
- Robot Framework
- Browser (Playwright)
- Python
- Faker

## Como executar

1. Clonar o repositório, instalar as dependências
```
pip install -r requirements.text
```

2. Executar testes os testes com a função de retry
```
robot --listener RetryFailed -d ./logs tests/