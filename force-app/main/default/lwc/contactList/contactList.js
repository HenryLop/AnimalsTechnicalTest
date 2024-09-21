import { LightningElement, api, track, wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';

export default class ContactList extends LightningElement {
    @api accountId;
    @track contacts;
    @track error;
    @track noContacts = false;

    columns = [
        { label: 'Contact Name', fieldName: 'Name', type: 'text', sortable: true },
        { label: 'Email', fieldName: 'Email', type: 'email' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    ];

    @wire(getContactList, { accountId: '$accountId' })
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
            this.error = undefined;
            this.noContacts = data.length === 0;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
            this.noContacts = false;
        }
    }
}
