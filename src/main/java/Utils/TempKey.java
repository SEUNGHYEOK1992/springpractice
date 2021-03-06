package Utils;

import java.util.Random;

public class TempKey {
	private boolean lowerChk;
	private int size;
	
	public String getKeys(int size, boolean lowerChk) {
		this.size = size;
		this.lowerChk = lowerChk;
		return init();
	}

	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75)+48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}
		} while (sb.length() < size);
		if(lowerChk) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
}
