import 'dart:convert';

TokenRes tokenResFromJson(String str) => TokenRes.fromJson(json.decode(str));

String tokenResToJson(TokenRes data) => json.encode(data.toJson());

class TokenRes {
    String code;
    Data data;

    TokenRes({
        required this.code,
        required this.data,
    });

    factory TokenRes.fromJson(Map<String, dynamic> json) => TokenRes(
        code: json["code"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
    };
}

class Data {
    String token;
    List<InstanceServer> instanceServers;

    Data({
        required this.token,
        required this.instanceServers,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        instanceServers: List<InstanceServer>.from(json["instanceServers"].map((x) => InstanceServer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "instanceServers": List<dynamic>.from(instanceServers.map((x) => x.toJson())),
    };
}

class InstanceServer {
    String endpoint;
    String protocol;
    int pingInterval;
    int pingTimeout;

    InstanceServer({
        required this.endpoint,
        required this.protocol,
        required this.pingInterval,
        required this.pingTimeout,
    });

    factory InstanceServer.fromJson(Map<String, dynamic> json) => InstanceServer(
        endpoint: json["endpoint"],
        protocol: json["protocol"],
        pingInterval: json["pingInterval"],
        pingTimeout: json["pingTimeout"],
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint,
        "protocol": protocol,
        "pingInterval": pingInterval,
        "pingTimeout": pingTimeout,
    };
}
