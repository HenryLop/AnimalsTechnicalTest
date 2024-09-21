import { LightningElement, track } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList';

export default class AccountList extends LightningElement {
    @track accounts;
    @track error;
    @track selectedAccountId;

    columns = [
        {
            label: 'Account Name',
            fieldName: 'accountName',
            type: 'button',
            typeAttributes: {
                label: { fieldName: 'Name' },
                name: 'view_contacts',
                variant: 'base',
            },
        },
    ];

    connectedCallback() {
        this.loadAccounts();
    }

    loadAccounts() {
        getAccountList()
            .then((result) => {
                this.accounts = result;
                this.error = undefined;
            })
            .catch((error) => {
                this.error = error;
                this.accounts = undefined;
            });
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        if (actionName === 'view_contacts') {
            this.selectedAccountId = row.Id;
        }
    }
}
