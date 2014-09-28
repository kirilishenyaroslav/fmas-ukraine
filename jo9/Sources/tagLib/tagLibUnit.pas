unit tagLibUnit;

interface

uses pFIBDatabase, pFIBQuery, pFIBStoredProc, pFIBDataSet, Dialogs, FIBDataBase,
     Controls, Forms, IB_Externals, Classes, Registry, Windows, ExtCtrls, IBase,
     cxSplitter, cxGrid, cxGridBandedTableView, cxGridDBBandedTableView,
     cxGridTableView, cxGridDBTableView, StylesMain, cxTL, cxDBTL, cxGridCustomTableView,
     dxBar, cxLookAndFeelPainters, cxLookAndFeels, dxStatusBar, SysUtils, Variants,
     s_DM_Styles, DevExTrans;

type

 TColParam = packed record
  BandIndex  : integer;
  ColIndex   : integer;
  RowIndex   : integer;
  LineCount  : integer;
  Width      : integer;
  GroupIndex : integer;
  Visible    : byte;
 end;

const
 DEF_ID_STYLE = 0;
 DEF_ID_BAR_STYLE = 2;
 DEF_ID_GRID_STYLE = 3;
 DEF_ID_STATUS_BAR_STYLE = 0;

var
 sys_id_User : integer;

 DataSet    : TpFIBDataSet;
 StoredProc : TpFIBStoredProc;
 WTrans     : TpFIBTransaction;

 function InitializeTagLib(DB : TpFIBDatabase; RTrans : TpFIBTransaction; id_User : integer) : boolean;
 function FinalizeTagLib : boolean;

 procedure ShowChangeStyle(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; fs : TFormStyle);

 procedure GetFormParams(InForm : TForm);
 procedure SetFormParams(InForm : TForm);
 function  SetColParams(_in : TColParam) : string;
 function  GetColParams(_in : string) : TColParam;
 procedure ExecParamsSP(PARENT_KEY : integer; KEY_NAME, PARAM_NAME, PARAM_VALUE : string);

 procedure DevExTranslate;

implementation

function InitializeTagLib(DB : TpFIBDatabase; RTrans : TpFIBTransaction; id_User : integer) : boolean;
begin
 Result := True;

 sys_id_User := id_User;

 try
  WTrans := TpFIBTransaction.Create(nil);
  WTrans.DefaultDatabase := DB;

  StoredProc := TpFIBStoredProc.Create(nil);
  StoredProc.Database := DB;
  StoredProc.Transaction := WTrans;

  DataSet := TpFIBDataSet.Create(Nil);
  DataSet.Database    := DB;
  DataSet.Transaction := WTrans;

  Application.CreateForm(TDM_Styles, DM_Styles);

  DataSet.SelectSQL.Text := 'select * from S_USER_STYLES_SEL(' + IntToStr(id_User) + ')';
  DataSet.Open;

  DM_Styles.StyleIndex     := DataSet['ID_STYLE'];
  DM_Styles.BarStyleIndex  := DataSet['ID_BAR_STYLE'];
  DM_Styles.GridStyleIndex := DataSet['ID_GRID_STYLE'];
  DM_Styles.StatusBarStyle := DataSet['ID_STATUSBAR_STYLE'];

  DataSet.Close;

  if VarIsNull(DM_Styles.StyleIndex)     then DM_Styles.StyleIndex     := DEF_ID_STYLE;
  if VarIsNull(DM_Styles.BarStyleIndex)  then DM_Styles.BarStyleIndex  := DEF_ID_BAR_STYLE;
  if VarIsNull(DM_Styles.GridStyleIndex) then DM_Styles.GridStyleIndex := DEF_ID_GRID_STYLE;
  if VarIsNull(DM_Styles.StatusBarStyle) then DM_Styles.StatusBarStyle := DEF_ID_STATUS_BAR_STYLE;
 except
  Result := False;
 end;
end;

function FinalizeTagLib : boolean;
begin
 Result := True;
 
 try
  if WTrans.Active then WTrans.Rollback;

  StoredProc.Free;
  WTrans.Free;
  DataSet.Free;
 except
  Result := False;
 end;
end;

procedure ShowChangeStyle(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; fs : TFormStyle);
begin
 StylesMain.ShowChangeStyle(AOwner, DBHandle, RTrans, fs, sys_id_User);
end;

procedure GetFormParams(InForm : TForm);
var
 i         : integer;
 id_Parent : integer;
 p         : TColParam;
begin
 if InForm = nil then Exit;
 if InForm.Owner = nil then begin
  InForm.Position := poScreenCenter;
  Exit;
 end;

 if DataSet.Active then DataSet.Close;

 DataSet.SelectSQL.Text := 'SELECT ID_KEY FROM S_REGESTRY WHERE NAME_KEY = '
 + QuotedStr('Forms Settings');
 DataSet.Open;

 if not VarIsNull(DataSet['ID_KEY']) then id_Parent := DataSet['ID_KEY'] else Exit;

 DataSet.Close;

 DataSet.SelectSQL.Text := 'select * from S_REGESTRY_SEL_PARAMS(' + IntToStr(id_Parent)
 + ',' + QuotedStr(InForm.ClassName) + ',' + IntToStr(sys_id_User) + ')';

 DataSet.Open;

 while not DataSet.Eof do begin
  if DataSet.FieldByName('PARAM_NAME').AsString = 'Left'   then if not VarIsNull(DataSet.FieldByName('PARAM_NAME').AsVariant) then InForm.Left   := DataSet.FieldByName('PARAM_VALUE').AsInteger;
  if DataSet.FieldByName('PARAM_NAME').AsString = 'Top'    then if not VarIsNull(DataSet.FieldByName('PARAM_NAME').AsVariant) then InForm.Top    := DataSet.FieldByName('PARAM_VALUE').AsInteger;
  if DataSet.FieldByName('PARAM_NAME').AsString = 'Width'  then if not VarIsNull(DataSet.FieldByName('PARAM_NAME').AsVariant) then InForm.Width  := DataSet.FieldByName('PARAM_VALUE').AsInteger;
  if DataSet.FieldByName('PARAM_NAME').AsString = 'Height' then if not VarIsNull(DataSet.FieldByName('PARAM_NAME').AsVariant) then InForm.Height := DataSet.FieldByName('PARAM_VALUE').AsInteger;

  DataSet.Next;
 end;

 DataSet.Close;

 DataSet.SelectSQL.Text := 'SELECT ID_KEY FROM S_REGESTRY_ADD('
 + IntToStr(id_Parent) + ',' + QuotedStr(InForm.ClassName) + ')';
 DataSet.Open;

 if not VarIsNull(DataSet['ID_KEY']) then id_Parent := DataSet['ID_KEY'] else Exit;

 DataSet.Close;

 for i := 0 to InForm.ComponentCount - 1 do
  if (InForm.Components[i] is TdxBarManager) then begin
   if not VarIsNull(DM_Styles.BarStyleIndex) then
    case DM_Styles.BarStyleIndex of
     0 : (InForm.Components[i] as TdxBarManager).Style := bmsEnhanced;
     1 : (InForm.Components[i] as TdxBarManager).Style := bmsFlat;
     2 : (InForm.Components[i] as TdxBarManager).Style := bmsOffice11;
     3 : (InForm.Components[i] as TdxBarManager).Style := bmsStandard;
     4 : (InForm.Components[i] as TdxBarManager).Style := bmsUseLookAndFeel;
     5 : (InForm.Components[i] as TdxBarManager).Style := bmsXP;
    end;
  end
  else if  (InForm.Components[i] is TcxGrid) then begin
   if not VarIsNull(DM_Styles.GridStyleIndex) then
    case DM_Styles.GridStyleIndex of
     0 : (InForm.Components[i] as TcxGrid).LookAndFeel.Kind := lfFlat;
//     1 : (InForm.Components[i] as TcxGrid).LookAndFeel.Kind := lfOffice11;
     2 : (InForm.Components[i] as TcxGrid).LookAndFeel.Kind := lfStandard;
     3 : (InForm.Components[i] as TcxGrid).LookAndFeel.Kind := lfUltraFlat;
    end;
  end
  else if (InForm.Components[i] is TcxGridBandedTableView) or (InForm.Components[i] is TcxGridDBBandedTableView) then begin
   with (InForm.Components[i] as TcxGridBandedTableView) do begin
    BeginUpdate;
    if not VarIsNull(DM_Styles.StyleIndex) then
     Styles.StyleSheet := DM_Styles.BGridPredefined.StyleSheets[DM_Styles.StyleIndex]
    else
     Styles.StyleSheet := DM_Styles.BGridPredefined.StyleSheets[0];

    EndUpdate;
   end;
  end  
  else if (InForm.Components[i] is TcxGridTableView) or (InForm.Components[i] is TcxGridDBTableView) then begin
   with (InForm.Components[i] as TcxCustomGridTableView) do begin
    BeginUpdate;
    if not VarIsNull(DM_Styles.StyleIndex) then
     Styles.StyleSheet := DM_Styles.GridPredefined.StyleSheets[DM_Styles.StyleIndex]
    else
     Styles.StyleSheet := DM_Styles.GridPredefined.StyleSheets[0];

    EndUpdate;
   end;
  end
  else if (InForm.Components[i] is TcxTreeList) or (InForm.Components[i] is TcxDBTreeList) then begin
   with (InForm.Components[i] as TcxCustomTreeListControl ) do begin
    BeginUpdate;
    if not VarIsNull(DM_Styles.StyleIndex) then
     Styles.StyleSheet := DM_Styles.TreePredefined.StyleSheets[DM_Styles.StyleIndex]
    else
     Styles.StyleSheet := DM_Styles.TreePredefined.StyleSheets[0];

    EndUpdate;
   end;
  end
  else if (InForm.Components[i] is TcxGridBandedColumn) or
     (InForm.Components[i] is TcxGridDBBandedColumn) 
  then begin
   DataSet.SelectSQL.Text := 'select * from S_REGESTRY_SEL_PARAM(' + IntToStr(id_Parent)
   + ',' + QuotedStr(InForm.Components[i].Name) + ','
   + IntToStr(sys_id_User) + ',' + QuotedStr('ColParams') + ')';

   DataSet.Open;

   if not VarIsNull(DataSet['PARAM_VALUE']) then begin
    p := GetColParams(DataSet['PARAM_VALUE']);

    (InForm.Components[i] as TcxGridBandedColumn).Position.BandIndex :=  p.BandIndex;
    (InForm.Components[i] as TcxGridBandedColumn).Position.ColIndex  :=  p.ColIndex;
    (InForm.Components[i] as TcxGridBandedColumn).Position.RowIndex  :=  p.RowIndex;
    (InForm.Components[i] as TcxGridBandedColumn).Position.LineCount :=  p.LineCount;
    (InForm.Components[i] as TcxGridBandedColumn).Width              :=  p.Width;
    (InForm.Components[i] as TcxGridBandedColumn).GroupIndex         :=  p.GroupIndex;
    (InForm.Components[i] as TcxGridBandedColumn).Visible            := (p.Visible = 1);
   end;

   DataSet.Close;
  end
  else
  if (InForm.Components[i] is TcxGridColumn) or
     (InForm.Components[i] is TcxGridDBColumn) then
  begin
   DataSet.SelectSQL.Text := 'select * from S_REGESTRY_SEL_PARAM(' + IntToStr(id_Parent)
   + ',' + QuotedStr(InForm.Components[i].Name) + ','
   + IntToStr(sys_id_User) + ',' + QuotedStr('ColParams') + ')';

   DataSet.Open;

   if not VarIsNull(DataSet['PARAM_VALUE']) then begin
    p := GetColParams(DataSet['PARAM_VALUE']);

    (InForm.Components[i] as TcxGridColumn).Width              :=  p.Width;
    (InForm.Components[i] as TcxGridColumn).GroupIndex         :=  p.GroupIndex;
    (InForm.Components[i] as TcxGridColumn).Visible            := (p.Visible = 1);
   end;

   DataSet.Close;
  end
  else if (InForm.Components[i] is TcxDBTreeListColumn) or (InForm.Components[i] is TcxTreeListColumn) then begin
   DataSet.SelectSQL.Text := 'select * from S_REGESTRY_SEL_PARAM(' + IntToStr(id_Parent)
   + ',' + QuotedStr(InForm.Components[i].Name) + ','
   + IntToStr(sys_id_User) + ',' + QuotedStr('ColParams') + ')';

   DataSet.Open;

   if not VarIsNull(DataSet['PARAM_VALUE']) then begin
    p := GetColParams(DataSet['PARAM_VALUE']);

    (InForm.Components[i] as TcxTreeListColumn).Position.BandIndex :=  p.BandIndex;
    (InForm.Components[i] as TcxTreeListColumn).Position.ColIndex  :=  p.ColIndex;
    (InForm.Components[i] as TcxTreeListColumn).Position.RowIndex  :=  p.RowIndex;
    (InForm.Components[i] as TcxTreeListColumn).Position.LineCount :=  p.LineCount;
    (InForm.Components[i] as TcxTreeListColumn).Width              :=  p.Width;
    (InForm.Components[i] as TcxTreeListColumn).Visible            := (p.Visible = 1);
   end;

   DataSet.Close;
  end
  else if (InForm.Components[i] is TcxSplitter) then begin
   if Assigned((InForm.Components[i] as TcxSplitter).Control) then
    if (InForm.Components[i] as TcxSplitter).AlignSplitter in [salTop, salBottom] then begin
     DataSet.SelectSQL.Text := 'select * from S_REGESTRY_SEL_PARAM(' + IntToStr(id_Parent)
     + ',' + QuotedStr(InForm.Components[i].Name) + ','
     + IntToStr(sys_id_User) + ',' + QuotedStr('Height') + ')';

     DataSet.Open;

     if not VarIsNull(DataSet['PARAM_VALUE']) then (InForm.Components[i] as TcxSplitter).Control.Height := DataSet['PARAM_VALUE'];

     DataSet.Close;
    end
    else begin
     DataSet.SelectSQL.Text := 'select * from S_REGESTRY_SEL_PARAM(' + IntToStr(id_Parent)
     + ',' + QuotedStr(InForm.Components[i].Name) + ','
     + IntToStr(sys_id_User) + ',' + QuotedStr('Width') + ')';

     DataSet.Open;

     if not VarIsNull(DataSet['PARAM_VALUE']) then (InForm.Components[i] as TcxSplitter).Control.Width := DataSet['PARAM_VALUE'];

     DataSet.Close;
    end;
  end
  else if (InForm.Components[i] is TSplitter) then begin
   if (InForm.Components[i] as TSplitter).Align in [alTop, alBottom] then begin
    DataSet.SelectSQL.Text := 'select * from S_REGESTRY_SEL_PARAM(' + IntToStr(id_Parent)
    + ',' + QuotedStr(InForm.Components[i].Name) + ','
    + IntToStr(sys_id_User) + ',' + QuotedStr('Top') + ')';

    DataSet.Open;

    if not VarIsNull(DataSet['PARAM_VALUE']) then (InForm.Components[i] as TSplitter).Top := DataSet['PARAM_VALUE'];

    DataSet.Close;
   end
   else begin
    DataSet.SelectSQL.Text := 'select * from S_REGESTRY_SEL_PARAM(' + IntToStr(id_Parent)
    + ',' + QuotedStr(InForm.Components[i].Name) + ','
    + IntToStr(sys_id_User) + ',' + QuotedStr('Left') + ')';

    DataSet.Open;

    if not VarIsNull(DataSet['PARAM_VALUE']) then (InForm.Components[i] as TSplitter).Left := DataSet['PARAM_VALUE'];

    DataSet.Close;
   end
  end
  else if (InForm.Components[i] is TdxStatusBar) then begin
   if not VarIsNull(DM_Styles.StatusBarStyle) then
    case DM_Styles.StatusBarStyle of
     0 : (InForm.Components[i] as TdxStatusBar).PaintStyle := stpsFlat;
     1 : (InForm.Components[i] as TdxStatusBar).PaintStyle := stpsOffice11;
     2 : (InForm.Components[i] as TdxStatusBar).PaintStyle := stpsStandard;
     3 : (InForm.Components[i] as TdxStatusBar).PaintStyle := stpsUseLookAndFeel;
     4 : (InForm.Components[i] as TdxStatusBar).PaintStyle := stpsXP;
    end;
  end;
end;

procedure SetFormParams(InForm : TForm);
var
 i         : integer;
 id_Parent : integer;
 p         : TColParam;
begin
 if InForm = nil then Exit;
 if InForm.Owner = nil then Exit;

 if InForm.WindowState = wsMaximized then Exit;

 StoredProc.Transaction.StartTransaction;

 StoredProc.StoredProcName := 'S_REGESTRY_ADD_PARAMS';
 StoredProc.Prepare;

 DataSet.SelectSQL.Text := 'SELECT ID_KEY FROM S_REGESTRY WHERE NAME_KEY = '
 + QuotedStr('Forms Settings');
 DataSet.Open;

 if not VarIsNull(DataSet['ID_KEY']) then id_Parent := DataSet['ID_KEY'] else Exit;

 DataSet.Close;

 ExecParamsSP(id_Parent, InForm.ClassName, 'Left',   IntToStr(InForm.Left));
 ExecParamsSP(id_Parent, InForm.ClassName, 'Top',    IntToStr(InForm.Top));
 ExecParamsSP(id_Parent, InForm.ClassName, 'Width',  IntToStr(InForm.Width));
 ExecParamsSP(id_Parent, InForm.ClassName, 'Height', IntToStr(InForm.Height));

 id_Parent := StoredProc.FieldByName('ID_KEY').asInteger;

 ///---------------------

 for i := 0 to InForm.ComponentCount - 1 do begin
   if (InForm.Components[i] is TcxGridBandedColumn) or (InForm.Components[i] is TcxGridDBBandedColumn) then begin
    if (InForm.Components[i] as TcxGridBandedColumn).Tag = 0 then begin
     p.BandIndex  := (InForm.Components[i] as TcxGridBandedColumn).Position.BandIndex;
     p.ColIndex   := (InForm.Components[i] as TcxGridBandedColumn).Position.ColIndex;
     p.RowIndex   := (InForm.Components[i] as TcxGridBandedColumn).Position.RowIndex;
     p.LineCount  := (InForm.Components[i] as TcxGridBandedColumn).Position.LineCount;
     p.Width      := (InForm.Components[i] as TcxGridBandedColumn).Width;
     p.GroupIndex := (InForm.Components[i] as TcxGridBandedColumn).GroupIndex;

     if (InForm.Components[i] as TcxGridBandedColumn).Visible then p.Visible := 1
     else p.Visible := 0;

     ExecParamsSP(id_Parent, InForm.Components[i].Name, 'ColParams', SetColParams(p));
    end;
   end
   else if (InForm.Components[i] is TcxGridColumn) or (InForm.Components[i] is TcxGridDBColumn) then begin
    if (InForm.Components[i] as TcxGridColumn).Tag = 0 then begin
     p.BandIndex  := 0;
     p.ColIndex   := 0;
     p.RowIndex   := 0;
     p.LineCount  := 0;
     p.Width      := (InForm.Components[i] as TcxGridColumn).Width;
     p.GroupIndex := (InForm.Components[i] as TcxGridColumn).GroupIndex;

     if (InForm.Components[i] as TcxGridColumn).Visible then p.Visible := 1
     else p.Visible := 0;

     ExecParamsSP(id_Parent, InForm.Components[i].Name, 'ColParams', SetColParams(p));
    end;
   end
   else if (InForm.Components[i] is TcxDBTreeListColumn) or (InForm.Components[i] is TcxTreeListColumn) then begin
    if (InForm.Components[i] as TcxTreeListColumn).Tag = 0 then begin
     p.BandIndex  := (InForm.Components[i] as TcxTreeListColumn).Position.BandIndex;
     p.ColIndex   := (InForm.Components[i] as TcxTreeListColumn).Position.ColIndex;
     p.RowIndex   := (InForm.Components[i] as TcxTreeListColumn).Position.RowIndex;
     p.LineCount  := (InForm.Components[i] as TcxTreeListColumn).Position.LineCount;
     p.Width      := (InForm.Components[i] as TcxTreeListColumn).Width;

     if (InForm.Components[i] as TcxTreeListColumn).Visible then p.Visible := 1
     else p.Visible := 0;

     ExecParamsSP(id_Parent, InForm.Components[i].Name, 'ColParams', SetColParams(p));
    end;
   end
   else if (InForm.Components[i] is TcxSplitter) then begin
    if Assigned((InForm.Components[i] as TcxSplitter).Control) then
    if (InForm.Components[i] as TcxSplitter).AlignSplitter in [salTop, salBottom] then
      ExecParamsSP(id_Parent, InForm.Components[i].Name, 'Height', IntToStr((InForm.Components[i] as TcxSplitter).Control.Height))
    else
      ExecParamsSP(id_Parent, InForm.Components[i].Name, 'Width', IntToStr((InForm.Components[i] as TcxSplitter).Control.Width));
   end
   else if (InForm.Components[i] is TSplitter) then
     if (InForm.Components[i] as TSplitter).Align in [alTop, alBottom] then
       ExecParamsSP(id_Parent, InForm.Components[i].Name, 'Top', IntToStr((InForm.Components[i] as TSplitter).Top))
     else
       ExecParamsSP(id_Parent, InForm.Components[i].Name, 'Left', IntToStr((InForm.Components[i] as TSplitter).Left));
 end;
 StoredProc.Transaction.Commit;
end;

procedure ExecParamsSP(PARENT_KEY : integer; KEY_NAME, PARAM_NAME, PARAM_VALUE : string);
begin
 StoredProc.ParamByName('PARENT_KEY').AsInteger := PARENT_KEY;
 StoredProc.ParamByName('KEY_NAME').AsString    := KEY_NAME;
 StoredProc.ParamByName('ID_USER').AsInteger    := sys_id_User;
 StoredProc.ParamByName('PARAM_NAME').AsString  := PARAM_NAME;
 StoredProc.ParamByName('PARAM_VALUE').AsString := PARAM_VALUE;

 StoredProc.ExecProc;
end;

function  SetColParams(_in : TColParam) : string;
begin
 Result := IntToStr(_in.BandIndex) + ';' + IntToStr(_in.ColIndex) + ';'
 + IntToStr(_in.RowIndex) + ';' + IntToStr(_in.LineCount) + ';'
 + IntToStr(_in.Width) + ';' + IntToStr(_in.GroupIndex) + ';'
 + IntToStr(_in.Visible);
end;

function  GetColParams(_in : string) : TColParam;
var
 s : string;
 k : integer;
begin
 s := _in;

 k := Pos(';', s);
 if Copy(s, 1, k - 1) <> '' then Result.BandIndex := StrToInt(Copy(s, 1, k - 1));
 s := Copy(s, k + 1, Length(s) - k);

 k := Pos(';', s);
 if Copy(s, 1, k - 1) <> '' then Result.ColIndex := StrToInt(Copy(s, 1, k - 1));
 s := Copy(s, k + 1, Length(s) - k);

 k := Pos(';', s);
 if Copy(s, 1, k - 1) <> '' then Result.RowIndex := StrToInt(Copy(s, 1, k - 1));
 s := Copy(s, k + 1, Length(s) - k);

 k := Pos(';', s);
 if Copy(s, 1, k - 1) <> '' then Result.LineCount := StrToInt(Copy(s, 1, k - 1));
 s := Copy(s, k + 1, Length(s) - k);

 k := Pos(';', s);
 if Copy(s, 1, k - 1) <> '' then Result.Width := StrToInt(Copy(s, 1, k - 1));
 s := Copy(s, k + 1, Length(s) - k);

 k := Pos(';', s);
 if Copy(s, 1, k - 1) <> '' then Result.GroupIndex := StrToInt(Copy(s, 1, k - 1));
 s := Copy(s, k + 1, Length(s) - k);

 if s <> '' then Result.Visible := StrToInt(s);
end;

procedure DevExTranslate;
begin
 DevExTrans.DevExTranslate;
end;

end.
