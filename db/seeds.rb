volodymyr = User.create(username: 'Volodymyr', email: 'volodymyr@example.com', password: 'mypass', role: 'admin')
iryna = User.create(username: 'Iryna', email: 'iryna@example.com', password: 'ho#ll_§1', role: 'admin')
volodymyr.accounts.create(currency: 'UAH', amount: 10_000)
volodymyr.accounts.create(currency: 'USD', amount: 1000)
iryna.accounts.create(currency: 'UAH', amount: 20_000)
iryna.accounts.create(currency: 'USD', amount: 2000)