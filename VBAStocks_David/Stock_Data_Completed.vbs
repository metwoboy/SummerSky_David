Sub multiYearStocks():

For Each ws In Worksheets
    ws.Cells(1, 9).Value = "Tickler"
    ws.Cells(1, 16).Value = "Tickler"
    ws.Cells(1, 10).Value = "Yearly Change"
    ws.Cells(1, 11).Value = "Percent Change"
    ws.Cells(1, 12).Value = "Total Stock Volume"
    ws.Cells(1, 17).Value = "Value"
    ws.Cells(2, 15).Value = "Greatest % Increase"
    ws.Cells(3, 15).Value = "Greatest % Decrease"
    ws.Cells(4, 15).Value = "Greatest Total Volume"
    

Dim a As Long
Dim tickerName As String
Dim openYearly As Double
Dim totalVolume As Double
totalVolume = 0

Dim totalYearly As Double
totalYearly = 0

Dim percentChange As Double

Dim tickerRow As Long
tickerRow = 2

Dim lastRow As Long
lastRow = ws.Cells(Rows.Count, 1).End(xlUp).Row


For a = 2 To lastRow
openYearly = ws.Cells(tickerRow, 3).Value


    If ws.Cells(a + 1, 1).Value <> ws.Cells(a, 1).Value Then
        tickerName = ws.Cells(a, 1).Value
        ws.Range("I" & tickerRow).Value = tickerName
    
        totalYearly = totalYearly + (ws.Cells(a, 6).Value - openYearly)
        ws.Range("J" & tickerRow).Value = totalYearly
    
        percentChange = (totalYearly / openYearly)
        ws.Range("K" & tickerRow).Value = percentChange
        ws.Range("K" & tickerRow).Style = "Percent"
        
        totalVolume = totalVolume + ws.Cells(a, 7).Value
        ws.Range("L" & tickerRow).Value = totalVolume
        

        tickerRow = tickerRow + 1
        totalYearly = 0
        totalVolume = 0
        openYearly = ws.Cells(tickerRow, 3).Value
    Else
        totalVolume = totalVolume + ws.Cells(a, 7).Value
    End If
Next a


Dim yearLastRow As Long
yearLastRow = ws.Cells(Rows.Count, 10).End(xlUp).Row

For a = 2 To yearLastRow

    If ws.Cells(a, 10).Value >= 0 Then
        ws.Cells(a, 10).Interior.ColorIndex = 4
    Else
        ws.Cells(a, 10).Interior.ColorIndex = 3
    End If
Next a
    
Dim percentLastRow As Long
percentLastRow = ws.Cells(Rows.Count, 11).End(xlUp).row

Dim percent_max As Double
percent_max = 0

Dim percent_min As Double
percent_min = 0


For a = 2 To percentLastRow


    If percent_max < ws.Cells(a, 11).Value Then
        percent_max = ws.Cells(a, 11).Value
        ws.Cells(2, 17).Value = percent_max
        ws.Cells(2, 17).Style = "Percent"
        ws.Cells(2, 16).Value = ws.Cells(a, 9).Value
    ElseIf percent_min > ws.Cells(a, 11).Value Then
        percent_min = ws.Cells(a, 11).Value
        ws.Cells(3, 17).Value = percent_min
        ws.Cells(3, 17).Style = "Percent"
        ws.Cells(3, 16).Value = ws.Cells(a, 9).Value
    End If
Next a


Dim totalVolumeRow As Long
totalVolumeRow = ws.Cells(Rows.Count, 12).End(xlUp).Row

Dim totalVolumeMax As Double
totalVolumeMax = 0


For a = 2 To totalVolumeRow

    If totalVolumeMax < ws.Cells(a, 12).Value Then
        totalVolumeMax = ws.Cells(a, 12).Value
        ws.Cells(4, 17).Value = totalVolumeMax
        ws.Cells(4, 16).Value = ws.Cells(a, 9).Value
    End If
Next a
    
Next ws

End Sub

