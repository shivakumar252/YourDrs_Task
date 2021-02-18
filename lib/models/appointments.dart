class Appointment {
  String id;
  String appointmentDate;
  String location;
  String patientName;
  String providerName;
  String dictationStatus;
  String appointmentTime;

  //constructor for add
  Appointment(this.appointmentDate, this.location, this.patientName,
      this.providerName, this.dictationStatus, this.appointmentTime);
  //constructor for edit
  Appointment.withId(
      this.id,
      this.appointmentDate,
      this.location,
      this.patientName,
      this.providerName,
      this.dictationStatus,
      this.appointmentTime);

//getters
  String get _id => this.id;
  String get _appointmentDate => this.appointmentDate;
  String get _location => this.location;
  String get _patientName => this.patientName;
  String get _providerName => this.providerName;
  String get _dictationStatus => this.dictationStatus;
  String get _appointmentTime => this.appointmentTime;

//setters
  set _firstName(String appointmentDate) {
    this.appointmentDate = appointmentDate;
  }

  set _lastName(String location) {
    this.location = location;
  }

  set _phone(String patientName) {
    this.patientName = patientName;
  }

  set _address(String providerName) {
    this.providerName = providerName;
  }

  set _email(String dictationStatus) {
    this.dictationStatus = dictationStatus;
  }

  set _photoUrl(String appointmentTime) {
    this.appointmentTime = appointmentTime;
  }

  Appointment.fromSnapShot(snapshot) {
    this.id = snapshot.key;
    this._firstName = snapshot.value['firstName'];
    this._lastName = snapshot.value['lastName'];
    this._phone = snapshot.value['phone'];
    this._address = snapshot.value['address'];
    this._email = snapshot.value['email'];
    this._photoUrl = snapshot.value['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": appointmentDate,
      "lastName": location,
      "phone": patientName,
      "address": providerName,
      "email": dictationStatus,
      "photoUrl": appointmentTime,
    };
  }
}
