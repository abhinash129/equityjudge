package com.nivesh.util;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.stereotype.Component;

import java.util.Base64;

@Component
public class EncryptDecryptServicesImpl implements IEncryptDecryptServices {

    @Override
    public String encrypt(String valueToEnc) throws Exception {
        Key key = generateKey();
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encValue = cipher.doFinal(valueToEnc.getBytes());
        return Base64.getEncoder().encodeToString(encValue);
    }

    @Override
    public String decrypt(String encryptedValue) throws Exception {
        Key key = generateKey();
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte[] decodedValue = Base64.getDecoder().decode(encryptedValue);
        byte[] decValue = cipher.doFinal(decodedValue);
        return new String(decValue);
    }

    private Key generateKey() throws Exception {
        return new SecretKeySpec(keyValue, ALGORITHM);
    }
}
