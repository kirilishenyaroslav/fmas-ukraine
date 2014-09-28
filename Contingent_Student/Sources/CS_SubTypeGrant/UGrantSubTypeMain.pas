unit UGrantSubTypeMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, ImgList, dxBar,
  dxBarExtItems, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ucs_types, uGrantSubTypeAdd,
  ibase, DogLoaderUnit;

type
  TfmGrantSubType = class(TForm)
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
    dxBarButton2: TdxBarButton;
    SelButton: TdxBarLargeButton;
    procedure RefreshButtonClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DeleteButtonClick(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
     res : variant;
    constructor  Create(AParameter:TcsParamPacks);reintroduce;
  end;

{var
  fmGrantSubType: TfmGrantSubType;  }

implementation

uses DM_GrantSubType;

{$R *.dfm}

constructor  TfmGrantSubType.Create(AParameter:TcsParamPacks);
begin
  Screen.Cursor := crHourGlass;

  inherited Create(AParameter.Owner);

  DM := TDM.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected := True;

  GridDBView.DataController.DataSource := DM.DataSourceSubTypeGrant;

  RefreshButtonClick(self);

  Screen.Cursor:=crDefault;
end;

procedure TfmGrantSubType.RefreshButtonClick(Sender: TObject);
begin
    DM.DataSetSubTypeGrant.Close;
    DM.DataSetSubTypeGrant.SQLs.SelectSQL.Text := 'select * from CS_GRANT_SUBTYPE s, CS_GRANT_TYPE t where t.id_grant_type=s.Id_grant_type  order by s.NAME_SUBTYPE';
    DM.DataSetSubTypeGrant.Open;
    If (DM.DataSetSubTypeGrant.IsEmpty) then
    begin
        EditButton.Enabled         := false;
        DeleteButton.Enabled       := false;
        SelButton.Enabled  := false;
    end else
    begin
        EditButton.Enabled         := true;
        DeleteButton.Enabled       := true;
        SelButton.Enabled  := true;
    end;
end;

procedure TfmGrantSubType.dxBarLargeButton3Click(Sender: TObject);
var
    ViewForm      : TfmGrantSubAdd;
    locate_id     : integer;
begin
    ViewForm                           := TfmGrantSubAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.id_Subtype_name                := null;
    ViewForm.id_type_name                := null;
    ViewForm.MemoName.Text             := '';

    ViewForm.OkButton.Caption          := 'Додати';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'CS_GRANT_SUBTYPE_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_GRANT_SUBTYPE').AsVariant     := ViewForm.id_Subtype_name;
          DM.StProc.ParamByName('NAME_SUBTYPE').AsString             := ViewForm.MemoName.Text;
          DM.StProc.ParamByName('ID_GRANT_TYPE').AsVariant        := ViewForm.id_type_name;

          DM.StProc.ExecProc;
          locate_id := DM.StProc.ParamByName('ID_GRANT_SUBTYPE_OUT').AsInteger;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури CS_GRANT_SUBTYPE_IU!');
        raise;
      end;
      end;
       RefreshButtonClick(self);
       DM.DataSetSubTypeGrant.Locate('ID_GRANT_SUBTYPE', locate_id, []);
end;

procedure TfmGrantSubType.EditButtonClick(Sender: TObject);
var
    ViewForm      : TfmGrantSubAdd;
    locate_id     : integer;
begin
    ViewForm                           := TfmGrantSubAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.id_Subtype_name           := DM.DataSetSubTypeGrant['ID_GRANT_SUBTYPE'];
    ViewForm.id_type_name              := DM.DataSetSubTypeGrant['ID_GRANT_TYPE'];
    ViewForm.MemoName.Text             := DM.DataSetSubTypeGrant['NAME_SUBTYPE'];
    ViewForm.ButtonEditType.Text       := DM.DataSetSubTypeGrant['NAME_TYPE'];

    ViewForm.OkButton.Caption          := 'Змінити';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'CS_GRANT_SUBTYPE_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_GRANT_SUBTYPE').AsVariant     := ViewForm.id_Subtype_name;
          DM.StProc.ParamByName('NAME_SUBTYPE').AsString          := ViewForm.MemoName.Text;
          DM.StProc.ParamByName('ID_GRANT_TYPE').AsVariant        := ViewForm.id_type_name;

          DM.StProc.ExecProc;
          locate_id := DM.DataSetSubTypeGrant['ID_GRANT_SUBTYPE'];;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури CS_GRANT_SUBTYPE_IU!');
        raise;
      end;
      end;
       RefreshButtonClick(self);
       DM.DataSetSubTypeGrant.Locate('ID_GRANT_SUBTYPE', locate_id, []);
end;


procedure TfmGrantSubType.ExitButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfmGrantSubType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then action:=caFree
end;

procedure TfmGrantSubType.DeleteButtonClick(Sender: TObject);
var
    locate_id,result_proc, locate_cur : integer;
begin
      if DM.DataSetSubTypeGrant.RecordCount = 0 then exit;

      if MessageDlg('Увага', 'Ви дійсно хочете видалити тип стипендії '+DM.DataSetSubTypeGrant['name_subtype']+'?', mtConfirmation, [mbYes, mbNo]) = mrYes then
      begin
          locate_cur := DM.DataSetSubTypeGrant['id_grant_subtype'];
          DM.DataSetSubTypeGrant.Prior;
          locate_id := DM.DataSetSubTypeGrant['id_grant_subtype'];
          DM.DataSetSubTypeGrant.Locate('id_grant_subtype', locate_cur, []);

          DM.StProc.StoredProcName := 'CS_GRANT_SUBTYPE_DEL';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('id_grant_subtype').AsInt64 := DM.DataSetSubTypeGrant['id_grant_subtype'];
          DM.StProc.ExecProc;

          result_proc := DM.StProc.ParamByName('DEPEND_OUT').AsInteger;
          if result_proc=1 then
          begin
              showmessage('Неможливо видалити запис. Він використовується!');
              exit;
          end;

          try
           Dm.WriteTransaction.Commit;
          except
           DM.WriteTransaction.Rollback;
           ShowMessage('Виникли помилки у роботі процедури CS_GRANT_SUBTYPE_DEL!');
           raise;
         end;
     end;
     RefreshButtonClick(self);
     DM.DataSetSubTypeGrant.Locate('id_grant_subtype', locate_id, []);
end;


procedure TfmGrantSubType.SelButtonClick(Sender: TObject);
begin
    Res:=VarArrayCreate([0,2],varVariant);
    Res[0] := DM.DataSetSubTypeGrant['ID_GRANT_SUBTYPE'];
    Res[1] := DM.DataSetSubTypeGrant['NAME_SUBTYPE'];
    Res[2] := DM.DataSetSubTypeGrant['ID_GRANT_TYPE'];
    ModalResult := mrOk;
end;

end.
