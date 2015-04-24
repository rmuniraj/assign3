end: recmbr1 recmbr2 recmbr3 clean

test_assign3_1: test_assign3_1.o expr.o dberror.o record_mgr.o storage_mgr.o buffer_mgr.o node_linked_list.o rec_req.o rm_serializer.o  
	cc -o recmbr1 test_assign3_1.o expr.o dberror.o record_mgr.o storage_mgr.o  buffer_mgr.o node_linked_list.o rm_serializer.o
test_assign3_2: test_assign3_2.o expr.o dberror.o record_mgr.o storage_mgr.o buffer_mgr.o node_linked_list.o rm_serializer.o 
	cc -o recmbr2 test_assign3_2.o expr.o dberror.o record_mgr.o storage_mgr.o  buffer_mgr.o node_linked_list.o rm_serializer.o
test_assign3_3: test_assign3_3.o expr.o dberror.o record_mgr.o storage_mgr.o buffer_mgr.o node_linked_list.o rm_serializer.o 
	cc -o recmbr3 test_assign3_3.o expr.o dberror.o record_mgr.o storage_mgr.o  buffer_mgr.o node_linked_list.o rm_serializer.o
test_assign3_1.o: test_assign3_1.c dberror.h expr.h record_mgr.h tables.h test_helper.h 
	cc -c test_assign3_1.c
test_assign3_2.o: test_assign3_2.c dberror.h expr.h record_mgr.h tables.h test_helper.h 
	       cc -c test_assign3_2.c
test_assign3_3.o: test_assign3_3.c dberror.h expr.h record_mgr.h tables.h test_helper.h 
	       cc -c test_assign3_3.c
dberror.o: dberror.c dberror.h
	cc -c dberror.c
storage_mgr.o: storage_mgr.c storage_mgr.h dberror.h
	cc -c storage_mgr.c
buffer_mgr.o: buffer_mgr.c buffer_mgr.h node_linked_list.h storage_mgr.h dt.h
	cc -c buffer_mgr.c
buffer_mgr_stat.o: buffer_mgr_stat.c buffer_mgr_stat.h buffer_mgr.h
	cc -c buffer_mgr_stat.c
node_linked_list.o: node_linked_list.c node_linked_list.h
	cc -c node_linked_list.c
expr.o: expr.c dberror.h tables.h
	cc -c expr.c
record_mgr.o: record_mgr.c record_mgr.h rec_req.h
	cc -c record_mgr.c
rm_serializer.o: rm_serializer.c dberror.h tables.h record_mgr.h
	cc -c rm_serializer.c

#Creates binary for test expr
test_expr:  test_expr.o expr.o dberror.o record_mgr.o storage_mgr.o buffer_mgr_stat.o node_linked_list.o rm_serializer.o
	cc -o test_expr test_expr.o expr.o dberror.o record_mgr.o storage_mgr.o buffer_mgr.o node_linked_list.o rm_serializer.c
test_expr.o: test_expr.c dberror.h expr.h record_mgr.h tables.h rec_req.h
	cc -c test_expr.c

#Clean up the directory
clean:
	-rm *.o
