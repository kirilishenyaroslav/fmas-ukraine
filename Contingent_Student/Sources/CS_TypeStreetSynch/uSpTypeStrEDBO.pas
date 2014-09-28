unit uSpTypeStrEDBO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, ImgList, dxBar,
  dxBarExtItems, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ibase, uSpTypeStrAdd, DogLoaderUnit;

type
  TfmSpTypeStrEDBO = class(TForm)
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridDBViewDB_id_type_str_edbo: TcxGridDBColumn;
    GridDBViewDB_name_typestr_EDBO: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    BarManager: TdxBarManager;
    SelButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
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
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    DB_handle : TISC_DB_HANDLE;
    edbo_types : integer;
    constructor Create(AOwner:TComponent);reintroduce;
  end;

var
  fmSpTypeStrEDBO: TfmSpTypeStrEDBO;

implementation

uses DM_TypeStreetSynch;

{$R *.dfm}

constructor TfmSpTypeStrEDBO.Create(AOwner:TComponent);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);

  RefreshButtonClick(self);
 // EditButton.Visible       := ivNever;

  Screen.Cursor:=crDefault;
end;

procedure TfmSpTypeStrEDBO.ExitButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfmSpTypeStrEDBO.SelButtonClick(Sender: TObject);
begin
     ModalResult := mrOk;
end;

procedure TfmSpTypeStrEDBO.RefreshButtonClick(Sender: TObject);
begin
    DM.DataSetOur.Close;
    DM.DataSetOur.SQLs.SelectSQL.Text := 'select Name_full as StreetTypeFullName,id_type_street as Id_StreetType, name_short from ini_type_street order by Name_full';
    DM.DataSetOur.Open;
end;

procedure TfmSpTypeStrEDBO.AddButtonClick(Sender: TObject);
var
    ViewForm      : TfmSpTypeStrAdd;
    locate_id     : integer;
begin
    ViewForm                           := TfmSpTypeStrAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;
    ViewForm.TextFullName.Text         := '';

    ViewForm.TextShortName.Text        := '';
    ViewForm.id_type_street            := null;
    ViewForm.OkButton.Caption          := 'Додати';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'INI_TYPE_STREET_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_TYPE_STREET').AsVariant         := ViewForm.id_type_street;
          DM.StProc.ParamByName('NAME_FULL').AsString               := ViewForm.TextFullName.Text;
          DM.StProc.ParamByName('NAME_SHORT').AsString              := ViewForm.TextShortName.Text;
          DM.StProc.ExecProc;
          locate_id := DM.StProc.ParamByName('ID_TYPE_STREET_OUT').AsInteger;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури INI_TYPE_STREET_IU!');
        raise;
      end;
      end;
       RefreshButtonClick(self);
       DM.DataSetOur.Locate('Id_StreetType', locate_id, []);
end;

procedure TfmSpTypeStrEDBO.EditButtonClick(Sender: TObject);
var
    ViewForm      : TfmSpTypeStrAdd;
    locate_id     : integer;
begin
    ViewForm                          := TfmSpTypeStrAdd.Create(self);
    ViewForm.DB_handle                := DM.DB.Handle;
    ViewForm.OkButton.Caption         := 'Змінити';

    if(DM.DataSetOur['name_short']<> null) then
        ViewForm.TextShortName.Text := DM.DataSetOur['name_short']
    else
        ViewForm.TextShortName.Text := '';
    if(DM.DataSetOur['StreetTypeFullName']<> null) then
        ViewForm.TextFullName.Text    := DM.DataSetOur['StreetTypeFullName']
    else
        ViewForm.TextFullName.Text    := '';
    if DM.DataSetOur['Id_StreetType'] <> null then
        ViewForm.id_type_street := DM.DataSetOur['Id_StreetType']
    else
        ViewForm.id_type_street := null;

      ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin
          DM.StProc.StoredProcName := 'INI_TYPE_STREET_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_TYPE_STREET').AsVariant         := ViewForm.id_type_street;
          DM.StProc.ParamByName('NAME_FULL').AsString               := ViewForm.TextFullName.Text;
          DM.StProc.ParamByName('NAME_SHORT').AsString              := ViewForm.TextShortName.Text;
          DM.StProc.ExecProc;

        DM.StProc.ExecProc;
        try
          DM.WriteTransaction.Commit;
         except
          DM.WriteTransaction.Rollback;
          ShowMessage('Возникли ошибки при работе процедуры INI_TYPE_STREET_IU!');
          raise;
        end;
      end;
       locate_id := DM.DataSetOur['Id_StreetType'];
       RefreshButtonClick(self);
       DM.DataSetOur.Locate('Id_StreetType', locate_id, []);
end;


procedure TfmSpTypeStrEDBO.DelButtonClick(Sender: TObject);
var
    locate_id : integer;
begin
      if DM.DataSetOur.RecordCount = 0 then exit;

      if MessageDlg('Увага', 'Ви дійсно хочете видалити тип вулиці?', mtConfirmation, [mbYes, mbNo]) = mrYes then
      begin
          DM.StProc.StoredProcName := 'INI_TYPE_STREET_DEL';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('id_type_street').AsVariant := DM.DataSetOur['Id_StreetType'];
          DM.StProc.ExecProc;

          try
           Dm.WriteTransaction.Commit;
          except
           DM.WriteTransaction.Rollback;
           ShowMessage('Виникли помилки у роботі процедури INI_TYPE_STREET_DEL!');
           raise;
         end;
     end;
     locate_id := DM.DataSetOur['Id_StreetType'];
     RefreshButtonClick(self);
     DM.DataSetOur.Locate('Id_StreetType', locate_id, []);
end;

end.
