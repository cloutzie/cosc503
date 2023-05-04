import socket
import sys
from struct import *
import array

try:
    s = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.IPPROTO_RAW)
except socket.error as msg:
    print(msg)
    sys.exit()

    
# IP HEADER
packet = ''

src_ip = '10.1.0.2'
dst_ip = '10.3.0.2'

ip_ver_ihl = 69
ip_tos = 0
ip_len = 0
ip_id = 12345
ip_frag = 0
ip_ttl = 64
ip_proto = 16
ip_check = 0
ip_srcadd = socket.inet_aton(src_ip)
ip_dstadd = socket.inet_aton(dst_ip)

ip_header = pack('!BBHHHBBH4s4s',
    ip_ver_ihl,
    ip_tos,
    ip_len,
    ip_id,
    ip_frag,
    ip_ttl,
    ip_proto,
    ip_check,
    ip_srcadd,
    ip_dstadd
    )

message = b'ALONE HONORED'

packet = ip_header + message

s.sendto(packet, (dst_ip, 0))


# TCP HEADER
tcp_src = 54321
tcp_dst = 7777
tcp_seq = 454
tcp_ack_seq = 0
tcp_data_off = 5
tcp_reserve = 0
tcp_flags = 0
tcp_win = 65535
tcp_chk = 0
tcp_urg_ptr = 0

tcp_off_res = (tcp_data_off << 4) + tcp_reserve

tcp_fin = 0
tcp_syn = 0
tcp_rst = 0
tcp_psh = 0
tcp_ack = 0
tcp_urg = 0
tcp_ece = 0
tcp_cwr = 0

tcp_flags = tcp_fin + (tcp_syn << 1) + (tcp_rst << 3) + (tcp_psh << 3) + (tcp_ack << 4) + (tcp_urg << 5) + (tcp_ece << 6) + (tcp_cwr << 7)

tcp_hdr = pack('!HHLLBBHHH',
    tcp_src,
    tcp_dst,
    tcp_seq,
    tcp_ack_seq,
    tcp_data_off,
    tcp_reserve,
    tcp_flags,
    tcp_win,
    tcp_chk,
    tcp_urg_ptr       
    )

user_data = b'CLOUTZIEVIRUS.EXE'
packet = ip_header + message

src_address = socket.inet_aton(src_ip)
dst_address = socket.inet_aton(dst_ip)
reserved = 0
protocol = socket.IPPROTO_TCP
tcp_length = len(tcp_hdr) + len(user_data)




ps_hdr = pack('!4s4sBBH', src_address, dst_address, reserved, protocol, tcp_length)
ps_hdr = ps_hdr + tcp_hdr + user_data

def checksum(data):
    if len(data) % 2:
        data += b'\0'
    res = sum(array.array("H", data))
    res = (res >> 16) + (res & 0xffff)
    res += res >> 16
    return (~res) & 0xffff

tcp_chk = checksum(ps_hdr)

tcp_hdr = pack('!HHLLBBH', 
    tcp_src,
    tcp_dst,
    tcp_seq,
    tcp_ack_seq,
    tcp_off_res,
    tcp_flags,
    tcp_win,
   ) + pack('H', tcp_chk) + pack('!H', tcp_urg_ptr)

packet = ip_header + tcp_hdr + user_data

s.sendto(packet, (dst_ip, 0))
