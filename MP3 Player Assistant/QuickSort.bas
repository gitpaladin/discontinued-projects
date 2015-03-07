Attribute VB_Name = "QuickSort"
Option Explicit

Public Function QuickSort(vData As Variant, Low As Long, Hi As Long)

' ---------------------------------------------------------
'
' Syntax:     QuickSort TmpAray(), Low, Hi
'
' Parameters:
'     vData - A variant pointing to an array to be sorted.
'       Low - LBounds(vData) low number of elements in the array
'        Hi - UBounds(vData) high number of elements in the array
'
' NOTE:       I start my arrays with one and not zero.
'             Make the appropriate changes to suit your code.
' ---------------------------------------------------------

' ---------------------------------------------------------
' Test to see if an array was passed
' ---------------------------------------------------------
  If Not IsArray(vData) Then Exit Function

' ---------------------------------------------------------
' Define local variables
' ---------------------------------------------------------
  Dim lTmpLow As Long
  Dim lTmpHi As Long
  Dim lTmpMid As Long
  Dim vTempVal As Variant
  Dim vTmpHold As Variant
  
' ---------------------------------------------------------
' Initialize local variables
' ---------------------------------------------------------
  lTmpLow = Low
  lTmpHi = Hi
  
' ---------------------------------------------------------
' Leave if there is nothing to sort
' ---------------------------------------------------------
  If Hi <= Low Then Exit Function

' ---------------------------------------------------------
' Find the middle to start comparing values
' ---------------------------------------------------------
  lTmpMid = (Low + Hi) \ 2
      
' ---------------------------------------------------------
' Move the item in the middle of the array to the
' temporary holding area as a point of reference while
' sorting.  This will change each time we make a recursive
' call to this routine.
' ---------------------------------------------------------
  vTempVal = vData(lTmpMid)
      
' ---------------------------------------------------------
' Loop until we eventually meet in the middle
' ---------------------------------------------------------
  Do While (lTmpLow <= lTmpHi)
 
     ' Always process the low end first.  Loop as long
     ' the array data element is less than the data in
     ' the temporary holding area and the temporary low
     ' value is less than the maximum number of array
     ' elements.
     Do While (vData(lTmpLow) < vTempVal And lTmpLow < Hi)
           lTmpLow = lTmpLow + 1
     Loop
      
     ' Now, we will process the high end.  Loop as long
     ' the data in the temporary holding area is less
     ' than the array data element and the temporary high
     ' value is greater than the minimum number of array
     ' elements.
     Do While (vTempVal < vData(lTmpHi) And lTmpHi > Low)
           lTmpHi = lTmpHi - 1
     Loop
            
     ' if the temp low end is less than or equal
     ' to the temp high end, then swap places
     If (lTmpLow <= lTmpHi) Then
         vTmpHold = vData(lTmpLow)          ' Move the Low value to Temp Hold
         vData(lTmpLow) = vData(lTmpHi)     ' Move the high value to the low
         vData(lTmpHi) = vTmpHold           ' move the Temp Hod to the High
         lTmpLow = lTmpLow + 1              ' Increment the temp low counter
         lTmpHi = lTmpHi - 1                ' Dcrement the temp high counter
     End If
     
  Loop
          
' ---------------------------------------------------------
' If the minimum number of elements in the array is
' less than the temp high end, then make a recursive
' call to this routine.  I always sort the low end
' of the array first.
' ---------------------------------------------------------
  If (Low < lTmpHi) Then
      QuickSort vData, Low, lTmpHi
  End If
          
' ---------------------------------------------------------
' If the temp low end is less than the maximum number
' of elements in the array, then make a recursive call
' to this routine.  The high end is always sorted last.
' ---------------------------------------------------------
  If (lTmpLow < Hi) Then
       QuickSort vData, lTmpLow, Hi
  End If
  
End Function

Public Function GetLongFileName(ByVal ShortPath As String)
  '获得长文件名的函数
  Dim FileNames As New Collection
  Dim CurrentPath As String
  Dim FileNameArrary() As String
  Dim Number As Long
  Dim i As Long
  
  FileNameArrary = Split(ShortPath, "\", -1, vbTextCompare)
  Number = UBound(FileNameArrary)
  FileNames.add Dir(ShortPath)
  
  For i = 0 To Number - 2
    ReDim Preserve FileNameArrary(Number - i - 1)
    CurrentPath = Join(FileNameArrary, "\")
    FileNames.add Dir(CurrentPath, vbDirectory)
  Next i
  
  FileNames.add Left(ShortPath, 2)
  
  For i = 1 To FileNames.Count
    GetLongFileName = IIf(i = 1, FileNames(1), FileNames(i) & "\" & GetLongFileName)
  Next i
End Function


