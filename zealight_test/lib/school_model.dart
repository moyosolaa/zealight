class SchoolModel {
    final dynamic stateProvince;
    final String? country;
    final List<String>? domains;
    final List<String>? webPages;
    final String? alphaTwoCode;
    final String? name;

    SchoolModel({
        this.stateProvince,
        this.country,
        this.domains,
        this.webPages,
        this.alphaTwoCode,
        this.name,
    });

    factory SchoolModel.fromJson(Map<String, dynamic> json) => SchoolModel(
        stateProvince: json["state-province"],
        country: json["country"],
        domains: json["domains"] == null ? [] : List<String>.from(json["domains"]!.map((x) => x)),
        webPages: json["web_pages"] == null ? [] : List<String>.from(json["web_pages"]!.map((x) => x)),
        alphaTwoCode: json["alpha_two_code"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "state-province": stateProvince,
        "country": country,
        "domains": domains == null ? [] : List<dynamic>.from(domains!.map((x) => x)),
        "web_pages": webPages == null ? [] : List<dynamic>.from(webPages!.map((x) => x)),
        "alpha_two_code": alphaTwoCode,
        "name": name,
    };
}
