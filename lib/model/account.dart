class Account{
    final String name, description, avatar;
    final int star;
    Account({
      this.name,
      this.description,
      this.star,
      this.avatar
    });
  
    factory Account.fromJson(Map<String, dynamic> json){
      return new Account(
        name: json['name'],
        description: json['description'],
        star : json['stargazers_count'],
        avatar: json['owner']['avatar_url']
      );
    }
  }
  