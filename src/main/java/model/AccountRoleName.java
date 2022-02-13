package model;

public class AccountRoleName {
    private String roleName;
    private Account account;

    public AccountRoleName() {
    }

    public AccountRoleName(String roleName, Account account) {
        this.roleName = roleName;
        this.account = account;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
}
