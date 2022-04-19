class AppUserModel {
   String? name;
   String? phone;
   String? age;
   String? email;
   String? image;
   String? twitter;
   String? uId;
   bool? admin;
   bool? isEmailVerified;
   AppUserModel({
     this.email,
     this.phone,
     this.age,
     this.name,
     this.twitter,
     this.uId,
     this.isEmailVerified,
     this.image,
     this.admin,
});
   AppUserModel.fromJson(Map <String,dynamic>json)
   {
     email =json['email'];
     phone =json['phone'];
     age =json['age'];
     name =json['name'];
     twitter =json['twitter'];
     uId =json['uId'];
     image =json['image'];
     isEmailVerified =json['isEmailVerified'];
     admin =json['admin'];
   }
    Map <String,dynamic> toMap(){
     return {
       'email':email,
       'phone':phone,
       'age':age,
       'name':name,
       'image':image,
       'twitter':twitter,
       'uId':uId,
       'isEmailVerified':isEmailVerified,
       'admin':admin,

     };
   }

}