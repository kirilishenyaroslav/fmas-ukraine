unit uGrantTypeMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, ImgList, dxBar,
  dxBarExtItems, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ucs_Types, uGrantTypeAdd,
  ibase, DogLoaderUnit;

type
  TfmGrantTypeMain = class(TForm)
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
    dxBarLargeButton4: TdxBarLargeButton;
    procedure RefreshButtonClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
      res : Variant;
      constructor  Create(AParameter:TcsParamPacks);reintroduce;
  end;

{var
  fmGrantTypeMain: TfmGrantTypeMain; }

implementation

uses DM_GrantType;

{$R *.dfm}

constructor  TfmGrantTypeMain.Create(AParameter:TcsParamPacks);
begin
  Screen.Cursor := crHourGlass;

  inherited Create(AParameter.Owner);

  DM := TDM.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected := True;

  GridDBView.DataController.DataSource := DM.DataSourceTypeGrant;

  RefreshButtonClick(self);

  Screen.Cursor:=crDefault;
end;

procedure TfmGrantTypeMain.RefreshButtonClick(Sender: TObject);
begin
    DM.DataSetTypeGrant.Close;
    DM.DataSetTypeGrant.SQLs.SelectSQL.Text := 'select * from CS_GRANT_TYPE order by name_type';
    DM.DataSetTypeGrant.Open;
    If (DM.DataSetTypeGrant.IsEmpty) then
    begin
        EditButton.Enabled         := false;
        DeleteButton.Enabled       := false;
        dxBarLargeButton4.Enabled  := false;
    end else
    begin
        EditButton.Enabled         := true;
        DeleteButton.Enabled       := true;
        dxBarLargeButton4.Enabled  := true;
    end;
end;

procedure TfmGrantTypeMain.dxBarLargeButton3Click(Sender: TObject);
var
    ViewForm      : TfmGrantTypeAdd;
    locate_id     : integer;
begin
    ViewForm                           := TfmGrantTypeAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.id_type_name                := null;
    ViewForm.MemoName.Text             := '';

    ViewForm.OkButton.Caption          := 'Додати';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'CS_GRANT_TYPE_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_GRANT_TYPE').AsVariant         := ViewForm.id_type_name;
          DM.StProc.ParamByName('NAME_TYPE').AsString              := ViewForm.MemoName.Text;

          DM.StProc.ExecProc;
          locate_id := DM.StProc.ParamByName('ID_GRANT_TYPE_OUT').AsInteger;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури CS_GRANT_TYPE_IU!');
        raise;
      end;
      end;
       RefreshButtonClick(self);
       DM.DataSetTypeGrant.Locate('ID_GRANT_TYPE', locate_id, []);
end;

procedure TfmGrantTypeMain.EditButtonClick(Sender: TObject);
var
    ViewForm      : TfmGrantTypeAdd;
    locate_id     : integer;
begin
    ViewForm                           := TfmGrantTypeAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.id_type_name              := DM.DataSetTypeGrant['ID_GRANT_TYPE'];
    ViewForm.MemoName.Text             := DM.DataSetTypeGrant['NAME_TYPE'];

    ViewForm.OkButton.Caption          := 'Змінити';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'CS_GRANT_TYPE_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_GRANT_TYPE').AsVariant         := ViewForm.id_type_name;
          DM.StProc.ParamByName('NAME_TYPE').AsString              := ViewForm.MemoName.Text;

          DM.StProc.ExecProc;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури CS_GRANT_TYPE_IU!');
        raise;
      end;
      end;
       locate_id := DM.DataSetTypeGrant['ID_GRANT_TYPE'];
       RefreshButtonClick(self);
       DM.DataSetTypeGrant.Locate('ID_GRANT_TYPE', locate_id, []);
end;

procedure TfmGrantTypeMain.DeleteButtonClick(Sender: TObject);
var
    locate_id, not_del, locate_cur : integer;
begin
      if DM.DataSetTypeGrant.RecordCount = 0 then exit;

      if MessageDlg('Увага', 'Ви дійсно хочете видалити тип стипендії '+DM.DataSetTypeGrant['NAME_TYPE']+'?', mtConfirmation, [mbYes, mbNo]) = mrYes then
      begin
          locate_cur := DM.DataSetTypeGrant['ID_GRANT_TYPE'];
          DM.DataSetTypeGrant.Prior;
          locate_id := DM.DataSetTypeGrant['ID_GRANT_TYPE'];
          DM.DataSetTypeGrant.Next;
          DM.DataSetTypeGrant.Locate('ID_GRANT_TYPE', locate_cur, []);

          DM.StProc.StoredProcName := 'CS_GRANT_TYPE_DEL';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_GRANT_TYPE').AsInt64 := DM.DataSetTypeGrant['ID_GRANT_TYPE'];
          DM.StProc.ExecProc;

          try
           Dm.WriteTransaction.Commit;
           Not_del := DM.StProc.ParamByName('RESULT_DEL').AsInteger;
           if(not_del=1) then
           begin
              showmessage('Неможливо видалити запис. Він використовується!');
              exit;
           end;
          except
           DM.WriteTransaction.Rollback;
           ShowMessage('Виникли помилки у роботі процедури CS_GRANT_TYPE_DEL!');
           raise;
         end;
     end;
     RefreshButtonClick(self);
     DM.DataSetTypeGrant.Locate('ID_GRANT_TYPE', locate_id, []);
end;

procedure TfmGrantTypeMain.ExitButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfmGrantTypeMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then action:=caFree
end;

procedure TfmGrantTypeMain.dxBarLargeButton4Click(Sender: TObject);
begin
    Res:=VarArrayCreate([0,1],varVariant);
    Res[0] := DM.DataSetTypeGrant['ID_GRANT_TYPE'];
    Res[1] := DM.DataSetTypeGrant['NAME_TYPE'];
    ModalResult := mrOk;
end;

end.
