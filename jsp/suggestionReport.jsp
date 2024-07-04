<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>
<div class="wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header" >
          <h1>
            <small>Module</small>
          </h1>
          
        </section>

        <!-- Main content -->
        <section class="content">









			<div class="row">
            <div class="col-xs-12">
              <div class="box">
              
                <div class="box-header">
                  <h3 class="box-title">Double Top Details</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example2" class="table table-bordered table-hover">
                    <thead>
									<tr>
										<th>SL.No</th>
										<th>COMPANY NAME</th>
										<th>PATTERN</th>
										<th>SELL</th>
										<th>BUY</th>
										<th>DONT TOUCH</th>
									</tr>
                    </thead>
                    <tbody>
									<c:forEach items="${SuggestionReport }" var="report" varStatus="status">
										<tr>
											<td><c:out value="${status.count}"/></td>
											<td><c:out value="${report.SC_NAME}" /></td>
											<td><c:out value="${report.PATTERN}" /></td>
											<td><c:out value="${report.SELL}" /></td>
											<td><c:out value="${report.BUY}" /></td>
											<td><c:out value="${report.DONT_TOUCH}" /></td>
											
										</tr>
									</c:forEach>


								</tbody>
                    
                    
                    
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

                    
              
              
              
            </div><!-- /.col -->
          
          
          
          </div><!-- /.row -->
			
<div class="row"><div class="col-sm-5">
<div class="dataTables_info" id="example2_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div></div>
<div class="col-sm-7">
<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate" style="margin-top:0px;"><ul class="pagination"><li class="paginate_button previous disabled" id="example2_previous" ><a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li><li class="paginate_button active"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0">1</a></li><li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0">2</a></li><li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0">3</a></li><li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0">4</a></li><li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0">5</a></li><li class="paginate_button "><a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0">6</a></li><li class="paginate_button next" id="example2_next"><a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a></li></ul></div></div>
</div>              
          
          
    

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
  </body>
  </html>
      






