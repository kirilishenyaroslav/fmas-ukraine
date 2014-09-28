unit uPiTypeDocMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, ImgList, dxBar,
  dxBarExtItems, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, upi_resources, uPiTypeDocAdd,
  DogLoaderUnit,AccMgmt;

type
  TfmTypeDocMain = class(TForm)
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridDBViewDBColumn1: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
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
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
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
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    res : Variant;
    is_choose : integer;
    id_user : integer;
      constructor  Create(AParameter:TpiParamPacks);reintroduce;
  end;

var
  fmTypeDocMain: TfmTypeDocMain;

implementation

uses DMPiTypeDoc;

{$R *.dfm}

constructor  TfmTypeDocMain.Create(AParameter:TpiParamPacks);
begin
  Screen.Cursor := crHourGlass;

  inherited Create(AParameter.Owner);

  DM := TDM.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected := True;
   
  GridDBView.DataController.DataSource := DM.DataSourceTypeDoc;
  id_user := AccMgmt.GetUserId;

 // RefreshButtonClick(self);

  Screen.Cursor:=crDefault;
end;

procedure TfmTypeDocMain.dxBarLargeButton3Click(Sender: TObject);
var
    ViewForm      : TfmPiTypeDocAdd;
    locate_id     : integer;
begin
    ViewForm                           := TfmPiTypeDocAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.id_type_name              := null;
    ViewForm.MemoName.Text             := '';

    ViewForm.Caption                   := 'Додавання типу документа';

    ViewForm.OkButton.Caption          := 'Додати';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'PI_SP_TYPE_DOC_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_TYPE_DOC').AsVariant         := ViewForm.id_type_name;
          DM.StProc.ParamByName('NAME_TYPE_DOC').AsString        := ViewForm.MemoName.Text;
          DM.StProc.ParamByName('ID_PROP_DEFAULT').AsVariant      := ViewForm.id_prop_income;

          DM.StProc.ExecProc;
          locate_id := DM.StProc.ParamByName('ID_TYPE_DOC_OUT').AsInteger;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури PI_SP_TYPE_DOC_IU!');
        raise;
      end;
      end;
       RefreshButtonClick(self);
       DM.DataSetTypeDoc.Locate('ID_TYPE_DOC', locate_id, []);
end;


procedure TfmTypeDocMain.EditButtonClick(Sender: TObject);
var
    ViewForm      : TfmPiTypeDocAdd;
    locate_id     : integer;
begin
    if DM.DataSetTypeDoc.RecordCount = 0 then exit;

    ViewForm                           := TfmPiTypeDocAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.id_type_name              := DM.DataSetTypeDoc['ID_TYPE_DOC'];
    ViewForm.MemoName.Text             := DM.DataSetTypeDoc['NAME_TYPE_DOC'];

    ViewForm.id_prop_income            := DM.DataSetTypeDoc['ID_PROP_DEFAULT'];
    if(DM.DataSetTypeDoc['ID_PROP_DEFAULT']<>null) then
         ViewForm.ButtonEditProp.Text       := inttostr(DM.DataSetTypeDoc['KOD_PROP'])+' '+DM.DataSetTypeDoc['NAME_PROP']  //DM.DataSetTypeDoc['KOD_PROP']+' '+
    else
         ViewForm.ButtonEditProp.Text       := '';
    ViewForm.OkButton.Caption          := 'Змінити';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'PI_SP_TYPE_DOC_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_TYPE_DOC').AsVariant         := ViewForm.id_type_name;
          DM.StProc.ParamByName('NAME_TYPE_DOC').AsString        := ViewForm.MemoName.Text;
          DM.StProc.ParamByName('ID_PROP_DEFAULT').AsVariant      := ViewForm.id_prop_income;
          DM.StProc.ExecProc;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури PI_SP_TYPE_DOC_IU!');
        raise;
      end;
      end;
      locate_id := DM.DataSetTypeDoc['ID_TYPE_DOC'];
       RefreshButtonClick(self);
      DM.DataSetTypeDoc.Locate('ID_TYPE_DOC', locate_id, []);
end;


procedure TfmTypeDocMain.DeleteButtonClick(Sender: TObject);
var
    locate_id : integer;
    locate_cur : integer;
begin
      if DM.DataSetTypeDoc.RecordCount = 0 then exit;

      if MessageDlg('Увага', 'Ви дійсно хочете видалити тип документа '+DM.DataSetTypeDoc['NAME_TYPE_DOC']+'?', mtConfirmation, [mbYes, mbNo]) = mrYes then
      begin
          locate_cur := DM.DataSetTypeDoc['ID_TYPE_DOC'];
          DM.DataSetTypeDoc.Prior;
          locate_id := DM.DataSetTypeDoc['ID_TYPE_DOC'];
          DM.DataSetTypeDoc.Next;
          DM.DataSetTypeDoc.Locate('ID_TYPE_DOC', locate_cur, []);

          DM.StProc.StoredProcName := 'PI_SP_TYPE_DOC_DEL';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_TYPE_DOC').AsInt64 := locate_cur;
          DM.StProc.ExecProc;

          try
           Dm.WriteTransaction.Commit;
          except
           DM.WriteTransaction.Rollback;
           ShowMessage('Виникли помилки у роботі процедури PI_SP_TYPE_DOC_DEL!');
           raise;
         end;
     end;

     RefreshButtonClick(self);
     DM.DataSetTypeDoc.Locate('ID_TYPE_DOC', locate_id, []);
end;

procedure TfmTypeDocMain.dxBarLargeButton4Click(Sender: TObject);
begin
    if DM.DataSetTypeDoc.RecordCount = 0 then exit;
    Res:=VarArrayCreate([0,1],varVariant);
    Res[0] := DM.DataSetTypeDoc['ID_TYPE_DOC'];
    Res[1] := DM.DataSetTypeDoc['NAME_TYPE_DOC'];
    ModalResult := mrOk;
end;

procedure TfmTypeDocMain.RefreshButtonClick(Sender: TObject);
begin
    if(is_choose=1) then
    begin
        DM.DataSetTypeDoc.Close;
        DM.DataSetTypeDoc.SQLs.SelectSQL.Text := 'select * from PI_SP_TYPE_DOC_BY_USER(:id_user) order by name_type_doc';
        DM.DataSetTypeDoc.Prepare;
        DM.DataSetTypeDoc.ParamByName('id_user').AsInteger := id_user;
        DM.DataSetTypeDoc.Open;
    end
    else
    begin
        DM.DataSetTypeDoc.Close;
        DM.DataSetTypeDoc.SQLs.SelectSQL.Text := 'select * from PI_SP_TYPE_DOC d left join  PI_SP_PROP_INCOME i on d.id_prop_default=i.id_prop_income order by name_type_doc';
        DM.DataSetTypeDoc.Open;
    end;
end;

procedure TfmTypeDocMain.ExitButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfmTypeDocMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then action:=caFree
end;

procedure TfmTypeDocMain.FormShow(Sender: TObject);
begin
    RefreshButtonClick(self);
end;

end.
