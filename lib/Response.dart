class Response {
  String originatorConversationId;
  String conversationId;
  String responseDescription;

  Response(
      {this.originatorConversationId,
        this.conversationId,
        this.responseDescription});

  Response.fromJson(Map<String, dynamic> json) {
    originatorConversationId = json['OriginatorConversationId'];
    conversationId = json['ConversationId'];
    responseDescription = json['ResponseDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OriginatorConversationId'] = this.originatorConversationId;
    data['ConversationId'] = this.conversationId;
    data['ResponseDescription'] = this.responseDescription;
    return data;
  }
}
