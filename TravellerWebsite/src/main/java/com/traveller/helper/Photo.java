package com.traveller.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Photo {

	public static boolean deleteFile(String path) {
		boolean b = false;

		try {
			File f = new File(path);
			f.delete();
			b = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;

	}

	public static boolean SaveFile(InputStream is, String path) {
		boolean b = false;
		try {
			byte[] by = new byte[is.available()];
			is.read(by);
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(by);

			fos.flush();
			fos.close();
			b = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;

	}

}
