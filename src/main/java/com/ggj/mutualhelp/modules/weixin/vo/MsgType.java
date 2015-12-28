package com.ggj.mutualhelp.modules.weixin.vo;

public enum MsgType {
	Text("text"), Image("image"), Music("music"), Video("video"), Voice("voice"), Location("location"), Link("link"), Event("event");
	private String msgType = "";
	
	MsgType(String msgType) {
		this.msgType = msgType;
	}
	
	/**
	 * @return the msgType
	 */
	@Override
	public String toString() {
		return msgType;
	}
	
	public static void main(String[] args) {
		System.out.println(MsgType.Text);
	}
}
