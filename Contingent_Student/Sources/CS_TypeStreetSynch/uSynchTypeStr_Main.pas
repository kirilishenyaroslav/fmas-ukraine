unit uSynchTypeStr_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  cxClasses, ImgList, dxBar, dxBarExtItems, ucs_Types,
  cxDropDownEdit, cxCheckBox, uSynchTypeStrEdit,DogLoaderUnit,
  AppStruClasses, RxMemDS,AppEvnts;

type
  TfrmSynchTypeStr_Main = class(TForm)
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    DisabledLargeImages: TImageList;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridDBViewDB_id_type_str: TcxGridDBColumn;
    GridDBViewDB_Name_type_str: TcxGridDBColumn;
    GridDBViewDB_id_type_str_edbo: TcxGridDBColumn;
    GridDBViewDB_name_typestr_EDBO: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    GridDBView_default: TcxGridDBColumn;
    dxBarLargeButton3: TdxBarLargeButton;
    procedure AddButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure GridDBViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ExitButtonClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
  private
  EDBOGuidesIntf: TFMASAppModule;
  EDBOPersonIntf: TFMASAppModule;
  Result : boolean;
  public
    res:Variant;
    Is_admin:Boolean;
    function MyCsConnectToEdbo: Boolean;
    function GetStreetTypeFromEdbo: Boolean;
    constructor  Create(AParameter:TcsParamPacks);reintroduce;
  end;

var
  frmSynchTypeStr_Main: TfrmSynchTypeStr_Main;

implementation

uses DM_TypeStreetSynch;

{$R *.dfm}
constructor  TfrmSynchTypeStr_Main.Create(AParameter:TcsParamPacks);
begin
  Screen.Cursor := crHourGlass;

  inherited Create(AParameter.Owner);

  DM := TDM.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected := True;

  GridDBView.DataController.DataSource := DM.DataSourceTypeStr;

  RefreshButtonClick(self);


  Screen.Cursor:=crDefault;
end;


function TfrmSynchTypeStr_Main.MyCsConnectToEdbo: Boolean;
var
    path_str: string;
begin
    try
        Result := True;
        with TFMASAppModuleCreator.Create do
        begin
            path_str := ExtractFilePath(Application.ExeName) + 'Contingent_Student\';

       //Экземпляр для работы с веб-сервисом EDBOGuides
            EDBOGuidesIntf := CreateFMASModule(path_str, 'EDBOIntf');
            if (EDBOGuidesIntf = nil)
                then begin
                Dialogs.MessageDlg('Помилка при роботі з модулем взаємодії з ЄДБО', mtError, [mbOk],0);
                Result := False;
            end;
       //Экземпляр для работы с веб-сервисом EDBOPerson
            EDBOPersonIntf := CreateFMASModule(path_str, 'EDBOIntf');
            if (EDBOPersonIntf = nil)
                then begin
                Dialogs.MessageDlg('Помилка при роботі з модулем взаємодії з ЄДБО', mtError, [mbOk],0);
                Result := False;
            end;
        end;

    except on E: Exception do
        begin
            ShowMessage(E.Message);
            Result := False;
        end;
    end;
end;

function TfrmSynchTypeStr_Main.GetStreetTypeFromEdbo: Boolean;
var
    MemoryData_EDBO: TRxMemoryData;
    i: Integer;
begin
    Result := True;
    MemoryData_Edbo := TRxMemoryData.Create(Self);

    (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('StreetTypesGet', MemoryData_EDBO);

    try
        MemoryData_EDBO.Open;
        MemoryData_EDBO.First;
    except on E: Exception do Showmessage(E.Message);
    end;

    DM.RxMem_EdboStreetType.Close;
    DM.RxMem_EdboStreetType.EmptyTable;
    DM.RxMem_EdboStreetType.Open;


    for i := 0 to MemoryData_EDBO.RecordCount - 1 do
    begin
      try
        DM.RxMem_EdboStreetType.Insert;
        DM.RxMem_EdboStreetType.FieldByName('Id_StreetType').AsInteger := MemoryData_EDBO['FId_StreetType'];
        DM.RxMem_EdboStreetType.FieldByName('Id_StreetTypeName').AsInteger := MemoryData_EDBO['FId_StreetTypeName'];
        if(MemoryData_EDBO['FStreetTypeFullName']<>null) then
            DM.RxMem_EdboStreetType.FieldByName('StreetTypeFullName').AsString := MemoryData_EDBO['FStreetTypeFullName']
        else
            DM.RxMem_EdboStreetType.FieldByName('StreetTypeFullName').AsString := '';
        if(MemoryData_EDBO['FStreetTypeShortName']<>null) then
            DM.RxMem_EdboStreetType.FieldByName('StreetTypeShortName').AsString := MemoryData_EDBO['FStreetTypeShortName']
        else
            DM.RxMem_EdboStreetType.FieldByName('StreetTypeShortName').AsString := '';
        DM.RxMem_EdboStreetType.Post;
      except on E: Exception do
      begin
          MessageDlg('Увага', E.Message, mtInformation, [mbOk]);
          exit;
      end;
      end;
          DM.StProc.StoredProcName := 'CS_INI_TYPE_STR_LINK_EDBO_INS';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          //DM.StProc.ParamByName('ID_TYPE_STREET').AsInt64              := DM.RxMem_EdboStreetType.FieldByName('Id_StreetType').AsInteger;
          DM.StProc.ParamByName('ID_STREET_TYPE_EDBO').AsInt64          := DM.RxMem_EdboStreetType.FieldByName('Id_StreetType').AsInteger;
          DM.StProc.ParamByName('id_street_type_name_edbo').AsInt64     := DM.RxMem_EdboStreetType.FieldByName('Id_StreetTypeName').AsInteger;
          DM.StProc.ParamByName('street_type_full_name_edbo').AsString  := DM.RxMem_EdboStreetType.FieldByName('StreetTypeFullName').AsString;
          DM.StProc.ParamByName('street_type_short_name_edbo').AsString := DM.RxMem_EdboStreetType.FieldByName('StreetTypeShortName').AsString;
          DM.StProc.ParamByName('IS_HAND').AsInt64                      := 0;
          DM.StProc.ParamByName('ID_STREET_TYPE').AsVariant               := null;
          DM.StProc.ExecProc;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури CS_INI_TYPE_STR_LINK_EDBO_INS!');
        raise;
      end;
    

    MemoryData_EDBO.Next;
  end;

  MemoryData_EDBO.Close;
  MemoryData_EDBO.Free;

  RefreshButtonClick(self);
end;



procedure TfrmSynchTypeStr_Main.AddButtonClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  if MyCsConnectToEdbo then
  begin
           if DM.RxMem_EdboStreetType.Active then
      begin
          DM.RxMem_EdboStreetType.Close;
          DM.RxMem_EdboStreetType.EmptyTable;
          DM.RxMem_EdboStreetType.Open;
      end
      else
          DM.RxMem_EdboStreetType.EmptyTable;
      if (EDBOGuidesIntf as IEDBOTools).InitEDBOConnection('EDBOGuides', DM.DB.Handle) then
      begin
          GetStreetTypeFromEdbo;
      end
      else
        Dialogs.MessageDlg('Не було встановлено підключення до ЄДБО!', mtError, [mbOk],0);

  end
  else
  begin
      Dialogs.MessageDlg('Подальша робота неможлива, не вдалося встановити зв''''язок з ЄДБО', mtError, [mbOk],0);
      exit;
  end;

  RefreshButtonClick(self);
  Screen.Cursor := crDefault;
end;


procedure TfrmSynchTypeStr_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then action:=caFree
end;

procedure TfrmSynchTypeStr_Main.EditButtonClick(Sender: TObject);
var
    ViewForm      : TfmSynchTypeStrEdit;
    locate_id     : integer;
begin
    ViewForm                          := TfmSynchTypeStrEdit.Create(self);
    ViewForm.DB_handle                := DM.DB.Handle;

    ViewForm.Type_Add                 :=1;

    if(DM.DataSetTypeStr['street_type_full_name_edbo']<> null) then
        ViewForm.ButtonEditStreetType.Text := DM.DataSetTypeStr['street_type_full_name_edbo']
    else
        ViewForm.ButtonEditStreetType.Text := '';
    if(DM.DataSetTypeStr['name_full']<> null) then
        ViewForm.ButtonEdit_TypeStr.Text    := DM.DataSetTypeStr['name_full']
    else
        ViewForm.ButtonEdit_TypeStr.Text    := '';
    if DM.DataSetTypeStr['id_type_street'] <> null then
        ViewForm.id_type_street := DM.DataSetTypeStr['id_type_street']
    else
        ViewForm.id_type_street := null;
    if DM.DataSetTypeStr['use_default'] =1 then
         ViewForm.CheckBoxDefault.Checked := true
    else
         ViewForm.CheckBoxDefault.Checked := false;
      ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin
        DM.StProc.StoredProcName := 'CS_INI_TYPE_STR_LINK_EDBO_UPD';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;
        DM.StProc.ParamByName('ID_TYPE_STREET_OlD').AsVariant    := DM.DataSetTypeStr['ID_TYPE_STREET'];
        DM.StProc.ParamByName('ID_TYPE_STREET').AsVariant          := ViewForm.id_type_street;
        DM.StProc.ParamByName('ID_STREET_TYPE_EDBO_OLD').AsInt64 := DM.DataSetTypeStr['ID_STREET_TYPE_EDBO'];
        DM.StProc.ParamByName('ID_STREET_TYPE_EDBO').AsInt64     := DM.DataSetTypeStr['ID_STREET_TYPE_EDBO'];
        if(ViewForm.CheckBoxDefault.Checked = true) then
             DM.StProc.ParamByName('USE_DEFAULT').AsInteger := 1
        else
             DM.StProc.ParamByName('USE_DEFAULT').AsInteger := 0;
        DM.StProc.ExecProc;
        try
          DM.WriteTransaction.Commit;
         except
          DM.WriteTransaction.Rollback;
          ShowMessage('Возникли ошибки при работе процедуры CS_INI_TYPE_STR_LINK_EDBO_UPD!');
          raise;
        end;
      end;
       locate_id := DM.DataSetTypeStr['ID_STREET_TYPE_EDBO'];
       RefreshButtonClick(self);
       DM.DataSetTypeStr.Locate('ID_STREET_TYPE_EDBO', locate_id, []);
end;

procedure TfrmSynchTypeStr_Main.RefreshButtonClick(Sender: TObject);
begin
    DM.DataSetTypeStr.Close;
    DM.DataSetTypeStr.SQLs.SelectSQL.Text := 'select * from CS_INI_TYPE_STREET_EDBO_SEL order by STREET_TYPE_FULL_NAME_EDBO';
    DM.DataSetTypeStr.Open;

    DM.DataSetEDBO.Close;
    DM.DataSetEDBO.SQLs.SelectSQL.Text := 'select distinct ID_STREET_TYPE_EDBO,ID_STREET_TYPE_NAME_EDBO, STREET_TYPE_FULL_NAME_EDBO,STREET_TYPE_SHORT_NAME_EDBO from CS_INI_TYPE_STREET_EDBO_SEL order by name_full';
    DM.DataSetEDBO.Open;

    DM.RxMem_EdboStreetType.Close;
    DM.RxMem_EdboStreetType.EmptyTable;
    DM.RxMem_EdboStreetType.Open;

    While not DM.DataSetEDBO.Eof
    do
    begin
        DM.RxMem_EdboStreetType.Insert;
        DM.RxMem_EdboStreetType.FieldByName('Id_StreetType').AsInteger      := DM.DataSetEDBO['ID_STREET_TYPE_EDBO'];
        DM.RxMem_EdboStreetType.FieldByName('Id_StreetTypeName').AsInteger  := DM.DataSetEDBO['ID_STREET_TYPE_NAME_EDBO'];
        DM.RxMem_EdboStreetType.FieldByName('StreetTypeFullName').AsString  := DM.DataSetEDBO['STREET_TYPE_FULL_NAME_EDBO'];
        DM.RxMem_EdboStreetType.FieldByName('StreetTypeShortName').AsString := DM.DataSetEDBO['STREET_TYPE_SHORT_NAME_EDBO'];
        DM.RxMem_EdboStreetType.Post;
        DM.DataSetEDBO.Next;
    end;
end;

procedure TfrmSynchTypeStr_Main.DeleteButtonClick(Sender: TObject);
var
    locate_id : integer;
begin
      if DM.DataSetTypeStr.RecordCount = 0 then exit;

      if MessageDlg('Увага', 'Ви дійсно хочете видалити зв''язок?', mtConfirmation, [mbYes, mbNo]) = mrYes then
      begin
          DM.StProc.StoredProcName := 'CS_INI_TYPE_STR_LINK_DEL';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_STREET_TYPE_EDBO').AsInt64 := DM.DataSetTypeStr['ID_STREET_TYPE_EDBO'];
          DM.StProc.ParamByName('ID_STREET_TYPE').AsVariant := DM.DataSetTypeStr['ID_TYPE_STREET'];
          DM.StProc.ExecProc;

          try
           Dm.WriteTransaction.Commit;
          except
           DM.WriteTransaction.Rollback;
           ShowMessage('Виникли помилки у роботі процедури CS_INI_TYPE_STR_LINK_DEL!');
           raise;
         end;
     end;
     locate_id := DM.DataSetTypeStr['ID_STREET_TYPE_EDBO'];
     RefreshButtonClick(self);
     DM.DataSetTypeStr.Locate('ID_STREET_TYPE_EDBO', locate_id, []);
end;

procedure TfrmSynchTypeStr_Main.GridDBViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
Var
  Arect:TRect;
begin
  if ((AViewInfo.GridRecord.Values[GridDBViewDB_Name_type_str.Index] = null) and (not AViewInfo.GridRecord.Focused)) then
  begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00AEA4DF;
      ACanvas.Canvas.FillRect(Arect);
  end;

  if ((AViewInfo.GridRecord.Values[GridDBViewDB_Name_type_str.Index] = null) and (AViewInfo.GridRecord.Focused)) then
  begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$007968CA;
      ACanvas.Canvas.FillRect(Arect);
  end;
end;


procedure TfrmSynchTypeStr_Main.ExitButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfrmSynchTypeStr_Main.dxBarLargeButton3Click(Sender: TObject);
var
    ViewForm      : TfmSynchTypeStrEdit;
begin
    ViewForm                           := TfmSynchTypeStrEdit.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;
    ViewForm.Type_Add                  := 0;
    ViewForm.ButtonEditStreetType.Text := '';

    ViewForm.ButtonEdit_TypeStr.Text    := '';
    ViewForm.id_type_street             := null;
    ViewForm.id_type_street_edbo        := null;

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'CS_INI_TYPE_STR_LINK_EDBO_INS';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_STREET_TYPE_EDBO').AsVariant         := ViewForm.id_type_street_edbo;
          DM.StProc.ParamByName('id_street_type_name_edbo').AsInt64     := ViewForm.id_type_street_name_edbo;
          DM.StProc.ParamByName('street_type_full_name_edbo').AsString  := ViewForm.ButtonEditStreetType.Text;
          DM.StProc.ParamByName('street_type_short_name_edbo').AsString := ViewForm.short_name;
          DM.StProc.ParamByName('IS_HAND').AsInteger                      := 1;
          DM.StProc.ParamByName('ID_STREET_TYPE').AsVariant            := ViewForm.id_type_street;
          DM.StProc.ExecProc;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури CS_INI_TYPE_STR_LINK_EDBO_INS!');
        raise;
      end;
      end;
       RefreshButtonClick(self);
       DM.DataSetTypeStr.Locate('ID_STREET_TYPE_EDBO', ViewForm.id_type_street_edbo, []);
end;

end.
