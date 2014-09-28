unit Propiska_Builds;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, ImgList, StdCtrls,
  cxContainer, cxLabel, ExtCtrls, dxBar, dxBarExtItems, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxStatusBar, FIBDataSet,
  pFIBDataSet, Propiska_Builds_Add, FIBQuery, pFIBQuery, pFIBStoredProc,
  DataModule1_Unit;

type
  Tfrm_AdresaPropiski = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1SELECT: TcxGridDBColumn;
    cxGrid1DBTableView1ID_BUILD: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_BUILD: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_BUILD: TcxGridDBColumn;
    cxGrid1DBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1SIZE: TcxGridDBColumn;
    cxGrid1DBTableView1FLOORS: TcxGridDBColumn;
    cxGrid1DBTableView1CHIEF: TcxGridDBColumn;
    cxGrid1DBTableView1OBLAST: TcxGridDBColumn;
    cxGrid1DBTableView1RAION: TcxGridDBColumn;
    cxGrid1DBTableView1TOWN: TcxGridDBColumn;
    cxGrid1DBTableView1STREET: TcxGridDBColumn;
    cxGrid1DBTableView1HOUSE: TcxGridDBColumn;
    cxGrid1DBTableView1INDEX: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    ViewButton: TdxBarLargeButton;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    ShortNameLabel: TEdit;
    AddressLabel: TEdit;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    dxStatusBar1: TdxStatusBar;
    WriteProc: TpFIBStoredProc;
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure DataSetAfterScroll(DataSet: TDataSet);
    procedure AddButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_AdresaPropiski: Tfrm_AdresaPropiski;

implementation

{$R *.dfm}

procedure Tfrm_AdresaPropiski.DataSetAfterOpen(DataSet: TDataSet);
begin
 if DataSet.RecordCount = 0 then begin
  EditButton.Enabled := false;
  DeleteButton.Enabled := false;
  SelectButton.Enabled := false;
  ViewButton.Enabled := false;
  end else begin
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
 // SelectButton.Enabled := CanSelect;
  ViewButton.Enabled := true;
 end;


end;

procedure Tfrm_AdresaPropiski.DataSetAfterScroll(DataSet: TDataSet);
begin
 if DataSet.RecordCount = 0 then exit;
 ShortNameLabel.Text := DataSet['SHORT_NAME'];
 AddressLabel.Text := 'г.' + DataSet['TOWN'] + ', ' + DataSet['RAION'] + ' р-н, ул. ' + DataSet['STREET'] + ', дом ' + DataSet['HOUSE'];
end;

procedure Tfrm_AdresaPropiski.AddButtonClick(Sender: TObject);
var
 ActionStr : string;
 new_id    : integer;
begin
 ActionStr := 'Добавить';
 BuildsFormAdd_Propi := TBuildsFormAdd_Propi.Create(Self);
 BuildsFormAdd_Propi.Caption := ActionStr + ' ' + BuildsFormAdd_Propi.Caption;
 BuildsFormAdd_Propi.OKButton.Caption := 'Принять';
 
 if BuildsFormAdd_Propi.ShowModal = mrOK then begin
  // добавляем
  WriteProc.StoredProcName := 'ST_SP_PROPI_BUILDS_INSERT';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('NUM_BUILD').AsInteger := StrToInt(BuildsFormAdd_Propi.NumEdit.Text);
  WriteProc.ParamByName('NAME_BUILD').AsString := BuildsFormAdd_Propi.NameEdit.Text;
  WriteProc.ParamByName('SHORT_NAME').AsString := BuildsFormAdd_Propi.ShortEdit.Text;
  WriteProc.ParamByName('P_SIZE').AsFloat := StrToFloat(BuildsFormAdd_Propi.SizeEdit.Text);
  WriteProc.ParamByName('FLOORS').AsInteger := StrToInt(BuildsFormAdd_Propi.FloorEdit.Text);
  WriteProc.ParamByName('CHIEF').AsString := BuildsFormAdd_Propi.ChiefEdit.Text;
  WriteProc.ParamByName('OBLAST').AsString := BuildsFormAdd_Propi.OblastEdit.Text;
  WriteProc.ParamByName('RAION').AsString := BuildsFormAdd_Propi.RaionEdit.Text;
  WriteProc.ParamByName('TOWN').AsString := BuildsFormAdd_Propi.TownEdit.Text;
  WriteProc.ParamByName('STREET').AsString := BuildsFormAdd_Propi.StreetEdit.Text;
  WriteProc.ParamByName('HOUSE').AsString := BuildsFormAdd_Propi.HouseEdit.Text;
  WriteProc.ParamByName('P_INDEX').AsInteger := StrToInt(BuildsFormAdd_Propi.IndexEdit.Text);
  WriteProc.ExecProc;
  new_id := WriteProc['KOD_BUILD'].AsInteger;
  try
  WriteProc.Transaction.Commit;
  WriteProc.Close;
  except
  WriteProc.Transaction.Rollback;
  WriteProc.Close;
  raise;
  end;
  DataSet.CloseOpen(true);
  DataSet.Locate('KOD_BUILD', new_id, []);
 end;
 BuildsFormAdd_Propi.Free;
 end;

procedure Tfrm_AdresaPropiski.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure Tfrm_AdresaPropiski.ViewButtonClick(Sender: TObject);
begin
 BuildsFormAdd_Propi := TBuildsFormAdd_Propi.Create(Self);
 BuildsFormAdd_Propi.NumEdit.Text := DataSet['NUM_BUILD'];
 BuildsFormAdd_Propi.ShortEdit.Text := DataSet['SHORT_NAME'];
 BuildsFormAdd_Propi.NameEdit.Text := DataSet['NAME_BUILD'];
 BuildsFormAdd_Propi.SizeEdit.Text := DataSet['P_SIZE'];
 BuildsFormAdd_Propi.FloorEdit.Text := DataSet['FLOORS'];
 BuildsFormAdd_Propi.ChiefEdit.Text := DataSet['CHIEF'];
 BuildsFormAdd_Propi.OblastEdit.Text := DataSet['OBLAST'];
 BuildsFormAdd_Propi.RaionEdit.Text := DataSet['RAION'];
 BuildsFormAdd_Propi.TownEdit.Text := DataSet['TOWN'];
 BuildsFormAdd_Propi.StreetEdit.Text := DataSet['STREET'];
 BuildsFormAdd_Propi.HouseEdit.Text := DataSet['HOUSE'];
 BuildsFormAdd_Propi.IndexEdit.Text := DataSet['P_INDEX'];
 BuildsFormAdd_Propi.cxGroupBox1.Enabled := false;
 BuildsFormAdd_Propi.cxGroupBox2.Enabled := false;
 BuildsFormAdd_Propi.OKButton.Visible := false;
 BuildsFormAdd_Propi.ShowModal;
 BuildsFormAdd_Propi.Free;
end;

procedure Tfrm_AdresaPropiski.FormShow(Sender: TObject);
begin
  DataSet.CloseOpen(true);
end;

procedure Tfrm_AdresaPropiski.EditButtonClick(Sender: TObject);
var
 ActionStr, ActionKeyStr : string;
 id        : integer;
begin
 id := DataSet['KOD_BUILD'];
 ActionStr := 'Изменить';
 ActionKeyStr:='Принять';
 BuildsFormAdd_Propi := TBuildsFormAdd_Propi.Create(Self);
 BuildsFormAdd_Propi.Caption := ActionStr + ' ' + BuildsFormAdd_Propi.Caption;
 BuildsFormAdd_Propi.OKButton.Caption := ActionKeyStr;
 BuildsFormAdd_Propi.NumEdit.Text := DataSet['NUM_BUILD'];
 BuildsFormAdd_Propi.ShortEdit.Text := DataSet['SHORT_NAME'];
 BuildsFormAdd_Propi.NameEdit.Text := DataSet['NAME_BUILD'];
 BuildsFormAdd_Propi.SizeEdit.Text := DataSet['P_SIZE'];
 BuildsFormAdd_Propi.FloorEdit.Text := DataSet['FLOORS'];
 BuildsFormAdd_Propi.ChiefEdit.Text := DataSet['CHIEF'];
 BuildsFormAdd_Propi.OblastEdit.Text := DataSet['OBLAST'];
 BuildsFormAdd_Propi.RaionEdit.Text := DataSet['RAION'];
 BuildsFormAdd_Propi.TownEdit.Text := DataSet['TOWN'];
 BuildsFormAdd_Propi.StreetEdit.Text := DataSet['STREET'];
 BuildsFormAdd_Propi.HouseEdit.Text := DataSet['HOUSE'];
 BuildsFormAdd_Propi.IndexEdit.Text := DataSet['P_INDEX'];
 if BuildsFormAdd_Propi.ShowModal = mrOK then begin
  // изменяем
  WriteProc.StoredProcName := 'ST_SP_PROPI_BUILDS_UPDATE';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('KOD_BUILD').AsInteger := id;
  WriteProc.ParamByName('NUM_BUILD').AsInteger := StrToInt(BuildsFormAdd_Propi.NumEdit.Text);
  WriteProc.ParamByName('NAME_BUILD').AsString := BuildsFormAdd_Propi.NameEdit.Text;
  WriteProc.ParamByName('SHORT_NAME').AsString := BuildsFormAdd_Propi.ShortEdit.Text;
  WriteProc.ParamByName('P_SIZE').AsFloat := StrToFloat(BuildsFormAdd_Propi.SizeEdit.Text);
  WriteProc.ParamByName('FLOORS').AsInteger := StrToInt(BuildsFormAdd_Propi.FloorEdit.Text);
  WriteProc.ParamByName('CHIEF').AsString := BuildsFormAdd_Propi.ChiefEdit.Text;
  WriteProc.ParamByName('OBLAST').AsString := BuildsFormAdd_Propi.OblastEdit.Text;
  WriteProc.ParamByName('RAION').AsString := BuildsFormAdd_Propi.RaionEdit.Text;
  WriteProc.ParamByName('TOWN').AsString := BuildsFormAdd_Propi.TownEdit.Text;
  WriteProc.ParamByName('STREET').AsString := BuildsFormAdd_Propi.StreetEdit.Text;
  WriteProc.ParamByName('HOUSE').AsString := BuildsFormAdd_Propi.HouseEdit.Text;
  WriteProc.ParamByName('P_INDEX').AsInteger := StrToInt(BuildsFormAdd_Propi.IndexEdit.Text);
  WriteProc.ExecProc;
  try
  WriteProc.Transaction.Commit;
  WriteProc.Close;
  except
  WriteProc.Transaction.Rollback;
  WriteProc.Close;
  raise;
  end;
  DataSet.CloseOpen(true);
  DataSet.Locate('KOD_BUILD', id, []);
 end;
 BuildsFormAdd_Propi.Free;

end;

procedure Tfrm_AdresaPropiski.DeleteButtonClick(Sender: TObject);
var
 selected : integer;
begin
{ Screen.Cursor:=crHourGlass;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text:='select CAN from ST_SP_BUILDS_CAN_DELETE('+ inttostr(DataSet[KeyField])+')';
 ReadDataSet.Open;
 if ReadDataSet['Can']=0 then begin
 Screen.Cursor:=crDefault;
 ShowMessage('Невозможно удалить наименование. Данное наименование используется.');
 ReadDataSet.Close;
 exit;
 end;
 ReadDataSet.Close;
 Screen.Cursor:=crDefault;}

 if MessageBox(Handle,PChar('Вы действительно хотите удалить запись ?'),'Подтверждение удаления ...',MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
 // удаляем
 WriteProc.StoredProcName := 'ST_SP_PROPI_BUILDS_DELETE';
 WriteProc.Transaction.StartTransaction;
 WriteProc.Prepare;
 WriteProc.ParamByName('KOD_BUILD').AsInteger := DataSet['KOD_BUILD'];
 WriteProc.ExecProc;
 try
 WriteProc.Transaction.Commit;
 WriteProc.Close;
  except
  WriteProc.Transaction.Rollback;
  WriteProc.Close;
  raise;
  end;
 selected := cxGrid1DBTableView1.DataController.FocusedRowIndex-1;
 DataSet.CloseOpen(true);
 cxGrid1DBTableView1.DataController.FocusedRowIndex := selected;

end;

procedure Tfrm_AdresaPropiski.RefreshButtonClick(Sender: TObject);
begin
  DataSet.CloseOpen(true);
end;

procedure Tfrm_AdresaPropiski.SelectButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure Tfrm_AdresaPropiski.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

end.
