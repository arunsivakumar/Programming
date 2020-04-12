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
    var isCancelButtonEnabled: Bool
    var isBlurViewShowing: Bool
    var isActivityIndicatorShowing: Bool
    var oldPassword: String
    var newPassword: String
    var confirmPassword: String
    var inputFocus: InputFocus

    enum InputFocus {
        case noKeyboard
        case oldPassword
        case newPassword
        case confirmPassword
    }

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
        isCancelButtonEnabled = true
        isBlurViewShowing = false
        isActivityIndicatorShowing = false
        oldPassword = ""
        newPassword = ""
        confirmPassword = ""
        inputFocus = .noKeyboard
    }

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
