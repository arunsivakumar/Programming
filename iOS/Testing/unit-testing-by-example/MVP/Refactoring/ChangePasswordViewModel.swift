struct ChangePasswordViewModel {
    let title: String
    let oldPasswordPlaceholder: String
    let newPasswordPlaceholder: String
    let confirmPasswordPlaceholder: String
    let submitButtonLabel: String
    let enterNewPasswordMessage: String
    let newPasswordTooShortMessage: String
    let confirmationPasswordDoesNotMatchMessage: String
    let successMessage: String
    let okButtonLabel: String
    /*
    var oldPassword: String {
        get { passwordInputs.oldPassword }
        set { passwordInputs.oldPassword = newValue }
    }
    */
    /*
    var passwordInputs: PasswordInputs
    */
    
    /*
    typealias InputFocus = Refactoring.InputFocus
    */

    init(title: String,
         oldPasswordPlaceholder: String,
         newPasswordPlaceholder: String,
         confirmPasswordPlaceholder: String,
         submitButtonLabel: String,
         enterNewPasswordMessage: String,
         newPasswordTooShortMessage: String,
         confirmationPasswordDoesNotMatchMessage: String,
         successMessage: String,
         okButtonLabel: String
    ) {
        self.title = title
        self.oldPasswordPlaceholder = oldPasswordPlaceholder
        self.newPasswordPlaceholder = newPasswordPlaceholder
        self.confirmPasswordPlaceholder = confirmPasswordPlaceholder
        self.submitButtonLabel = submitButtonLabel
        self.enterNewPasswordMessage = enterNewPasswordMessage
        self.newPasswordTooShortMessage = newPasswordTooShortMessage
        self.confirmationPasswordDoesNotMatchMessage =
                confirmationPasswordDoesNotMatchMessage
        self.successMessage = successMessage
        self.okButtonLabel = okButtonLabel
        /*
        passwordInputs = PasswordInputs()
        */
    }

    /*
    var isOldPasswordEmpty: Bool {
        return passwordInputs.isOldPasswordEmpty
    }
    */
}
