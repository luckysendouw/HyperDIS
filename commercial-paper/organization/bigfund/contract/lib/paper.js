/*
 * Copyright IBM Corp. All Rights Reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
*/

'use strict';

// Utility class for ledger state
const State = require('../ledger-api/state.js');

// Enumerate commercial paper state values
const cpState = {
    ISSUED: 1,
    PENDING: 2,
    TRADING: 3,
    REDEEMED: 4,
    RATED: 5
};

/**
 * CommercialPaper class extends State class
 * Class will be used by application and smart contract to define a paper
 */
class CommercialPaper extends State {

    constructor(obj) {
        super(CommercialPaper.getClass(), [obj.issuer, obj.paperNumber]);
        Object.assign(this, obj);
    }

    /**
     * Basic getters and setters
    */
     getRater() {
        return this.rater;
    }

    setRater(newRater) {
        this.rater = newRater;
    }

    getRate() {
        return this.rate;
    }

    setRate(newRate) {
        this.rate = newRate;
    }

    getIssuer() {
        return this.issuer;
    }

    setIssuer(newIssuer) {
        this.issuer = newIssuer;
    }

    getOwner() {
        return this.owner;
    }

    setOwnerMSP(mspid) {
        this.mspid = mspid;
    }

    getOwnerMSP() {
        return this.mspid;
    }

    setOwner(newOwner) {
        this.owner = newOwner;
    }

    /**
     * Useful methods to encapsulate commercial paper states
     */
    setRated() {
        this.currentState = cpState.RATED;
    }

    setIssued() {
        this.currentState = cpState.ISSUED;
    }

    setTrading() {
        this.currentState = cpState.TRADING;
    }

    setRedeemed() {
        this.currentState = cpState.REDEEMED;
    }

    setPending() {
        this.currentState = cpState.PENDING;
    }

    isRated() {
        return this.currentState === cpState.RATED;
    }

    isIssued() {
        return this.currentState === cpState.ISSUED;
    }

    isTrading() {
        return this.currentState === cpState.TRADING;
    }

    isRedeemed() {
        return this.currentState === cpState.REDEEMED;
    }

    isPending() {
        return this.currentState === cpState.PENDING;
    }

    static fromBuffer(buffer) {
        return CommercialPaper.deserialize(buffer);
    }

    toBuffer() {
        return Buffer.from(JSON.stringify(this));
    }

    /**
     * Deserialize a state data to commercial paper
     * @param {Buffer} data to form back into the object
     */
    static deserialize(data) {
        return State.deserializeClass(data, CommercialPaper);
    }
    
    /**
     * Factory method to create a commercial paper object
     */
    static createInstance(issuer, paperNumber, issueDateTime, maturityDateTime, faceValue, rate) {
        return new CommercialPaper({ issuer, paperNumber, issueDateTime, maturityDateTime, faceValue, rate});
    }

 //   static updateInstance(issuer, paperNumber, issueDateTime, maturityDateTime, faceValue, rating) {
 //       return new CommercialPaper({ issuer, paperNumber, issueDateTime, maturityDateTime, faceValue, rating });
 //   }
    static getClass() {
        return 'org.papernet.commercialpaper';
    }
}

module.exports = CommercialPaper;
