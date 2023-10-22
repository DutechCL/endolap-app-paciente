extension Validations on String {
	bool get isMyEmail{
		String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
		
		RegExp regex = RegExp(pattern);

		return regex.hasMatch(this);
	}

	bool get isValid{
		return (this.trim().isNotEmpty) ? true : false;
	}

	bool get isMinString{
		return (this.trim().length < 8) ? false : true;
	}
}