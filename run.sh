function clear_proc()
{
	ps -ef | grep $1 | grep -v grep | awk '{print$2}' | xargs kill -9
}

clear_proc ocserv

ocserv -c /etc/ocserv/ocserv.conf
