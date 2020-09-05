/*
	Business Blockchain Training & Consulting SpA. All Rights Reserved.
	www.blockchainempresarial.com
	email: ricardo@blockchainempresarial.com
*/

package com.blockchainempresarial.hyperledger.fabric.samples.wallet;

import java.util.Objects;

import org.hyperledger.fabric.contract.annotation.DataType;
import org.hyperledger.fabric.contract.annotation.Property;

import com.owlike.genson.annotation.JsonProperty;

@DataType()
public final class Wallet {

	@Property()
	private final Double tokenAmount;

	@Property()
	private final String owner;

	public Double getTokenAmount() {
		return tokenAmount;
	}

	public String getOwner() {
		return owner;
	}

	public Wallet(@JsonProperty("tokenAmount") final Double tokenAmount, @JsonProperty("owner") final String owner) {
		this.tokenAmount = tokenAmount;
		this.owner = owner;
	}

	@Override
	public boolean equals(final Object obj) {
		if (this == obj) {
			return true;
		}

		if ((obj == null) || (getClass() != obj.getClass())) {
			return false;
		}

		Wallet other = (Wallet) obj;

		return Objects.deepEquals(new String[] { getTokenAmount().toString(), getOwner() },
				new String[] { other.getTokenAmount().toString(), other.getOwner() });
	}

	@Override
	public int hashCode() {
		return Objects.hash(getTokenAmount(), getOwner());
	}

	@Override
	public String toString() {
		return this.getClass().getSimpleName() + "@" + Integer.toHexString(hashCode()) + " [tokenAmount=" + tokenAmount
				+ ", owner=" + owner + "]";
	}
}
