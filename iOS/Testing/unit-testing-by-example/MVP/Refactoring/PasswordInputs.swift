struct PasswordInputs {
    /*
    init(oldPassword: String, newPassword: String, confirmPassword: String) {
        self.oldPassword = oldPassword
        self.newPassword = newPassword
        self.confirmPassword = confirmPassword
    }
    */
    
    /*
    var oldPassword = ""
    var newPassword = ""
    var confirmPassword = ""
    */

    let oldPassword: String
    let newPassword: String
    let confirmPassword: String

    var isOldPasswordEmpty: Bool {
        return oldPassword.isEmpty
    }

    var isNewPasswordEmpty: Bool {
        return newPassword.isEmpty
    }

    var isNewPasswordTooShort: Bool {
        return newPassword.count < 6
    }

    var isConfirmPasswordMismatched: Bool {
        return confirmPassword != newPassword
    }

}
