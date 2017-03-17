<!doctype html>
<html>
	
<body bgcolor="#87CEFA" text="#708090">
	
	
    <center><table border="0" width="1000">
     <width="50"><tr>
	<center><th><span style="font-size:30px;"><span style="font-family:Microsoft JhengHei;"><font color="green">
	<align="center" height="50">
	</span></span></th>
	
     </tr>
     <table border="1" width="1000">
	<th center width="550">
		<span style="font-family:Microsoft JhengHei;"font-size:20px;"> <font color=#000000> 圖片 </span></th>
	<th><b><span style="font-size:20px;">  <font color=#000000> 新增  </span></b></th>
     </table>
    <table border="1" width="1000" height="400">
	<tr>
		<td   width="460" height="420">
		    <span style="font-size:25px;"><font color="708090 "><center>請輸入資料</span> 
			<form name="insertstory" action="insertcrabpage?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data" width="11" height="11">
			<table>
				<tr>
					<td><img src="resources/pic/red.jpg" alt="" width="11" height="11" /> 中文名稱:</td>
					<td><input type='text' name='crabname'></td>
				</tr>
				<tr>
					<td><img src="resources/pic/red.jpg" alt="" width="11" height="11" /> 科別名稱:</td>
					<td><input type='text' name='crabsubject' /></td>
				</tr>
				<tr>
					<td><img src="resources/pic/red.jpg" alt="" width="11" height="11" /> 外觀形狀:</td>
					<td><input type='text' name='crabfeature' /></td>
				</tr>
				<tr>
					<td><img src="resources/pic/red.jpg" alt="" width="11" height="11" /> 習性:</td>
					<td><input type='text' name='crabhabits' /></td>
				</tr>
				<tr>
					<td><img src="resources/pic/red.jpg" alt="" width="11" height="11" /> GPS:</td>
					<td><input type='text' name='crablocation' /></td>
				</tr>
				<tr>
					<td colspan='1'><input name="submit" type="submit"
						value="儲存" /></td>
				</tr>
				<tr>
				 <input type="hidden" name="MAX_FILE_SIZE" value="2097152">
   				 <input type="file" name = "uploadname"  class="upl" />
				</tr>
				
			</table>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

		</form>

           

		</td>

	</tr>
    </table>

  	<!--<center><table border="5" width="1000">
	
	<th center width="550"><span style="font-size:20px;"><span style="font-family:Microsoft JhengHei;"> <font color=#d9d9d9> 新增   </span></span></th>
	<th center width="550"><span style="font-size:20px;"><span style="font-family:Microsoft JhengHei;"> <font color=#d9d9d9> 返回   </span></span></th>

</table>-->
</tr>
</table>


</body>  
</html>                    