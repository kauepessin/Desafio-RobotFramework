from faker import Faker

fake = Faker('pt_BR')


def get_account():
    account = {
        "name": fake.name(),
        "document": fake.cpf(),
        "phone": fake.random_number(11, True),
    }
    return account