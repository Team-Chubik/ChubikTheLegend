extends Node

# vytvoření proměnných
# connection => uchovává informace o spojení
# peerstream => proud packetů se serverem§
# received => vyšle signál když přijme TCP packet
var connection = null
var peerstream = null
signal received(code, string)

func _ready():
		print("Start client TCP")
		# Connect
		connection = StreamPeerTCP.new()
		connection.connect_to_host("127.0.0.1", 9090)
		peerstream = PacketPeerStream.new()
		peerstream.set_stream_peer(connection)

func _process(delta):
	if peerstream.get_available_packet_count() > 0 :
		var packet = peerstream.get_packet()
		var buffer = StreamPeerBuffer.new()
		buffer.set_data_array(packet)
		
		var type = buffer.get_u16()
		print('Recieve %s' % type)

# Funkce na posílání u16 [0 - 65 535] kódů
func send_code(code):
	var buffer = StreamPeerBuffer.new()
	buffer.put_16(code)
	peerstream.put_packet(buffer.get_data_array())

# Funkce na posílání stringů
func send_string(string):
	var buffer = StreamPeerBuffer.new()
	buffer.put_string(string)
	peerstream.put_packet(buffer.get_data_array())

# Funkce na posílání kombinovaných packetů
func send_combined(code,string):
	var buffer = StreamPeerBuffer.new()
	buffer.put_16(code)
	buffer.put_string(string)
	peerstream.put_packet(buffer.get_data_array())

# Pošle signál "received" s hodnotami (0,""), pokud nejsou změněny vstupem, jedná se o prázdné hodnoty
func send_signal(code=0,string=""):
	emit_signal("received",code,string)

"""
Kódy
############################
"""


"""
Code from example
########################x

func _process(delta):
		if connection.is_connected_to_host():
			pass

				if Input.is_action_just_released("ui_left"):
						var buffer = StreamPeerBuffer.new()
						buffer.put_u16(1001)
						buffer.put_string("COUCOU")
						peerstream.put_packet(buffer.get_data_array())

				if Input.is_action_just_released("ui_right"):
						var buffer = StreamPeerBuffer.new()
						buffer.put_u16(1002)
						peerstream.put_packet(buffer.get_data_array())
				
				if peerstream.get_available_packet_count() > 0 :
						var packet = peerstream.get_packet()
						var buffer = StreamPeerBuffer.new()
						buffer.set_data_array(packet)
						
						var type = buffer.get_u16()
						print('Recieve %s' % type)
						match type:
								1:
										var length = buffer.get_u32()
										print("My id is %s !" % buffer.get_string(length))
								1003:
										print("We recieve OK_GO_LEFT !")
								1004:
										print("We recieve OK_GO_RIGHT !")
"""
