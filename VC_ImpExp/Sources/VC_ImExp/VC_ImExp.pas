unit VC_ImExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls,
  DM, cxLookAndFeelPainters, cxButtons, Buttons, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMemo, cxProgressBar, ExtCtrls, inifiles, vc_SpBonus,
  GlobalSpr, uCommonSp;

type
  TMainForm = class(TForm)
    ADOConnection: TADOConnection;
    DataSource1: TDataSource;
    ADOStoredProc: TADOStoredProc;
    StartBtn: TcxButton;
    RefreshBtn: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    Memo: TcxMemo;
    Local_Progress: TcxProgressBar;
    Global_Progress: TcxProgressBar;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxButton1: TcxButton;
    btnDepartments: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure StartBtnClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnDepartmentsClick(Sender: TObject);
  private
    TablesCount: integer;
    RegardsParams: array of string;
    procedure ProgressIni(PrBar : TcxProgressBar; MaxPos: integer; Action: string);
    procedure UpdateGlobalProgress;
    procedure UpdateLocalProgress;
    procedure DizzableButtons(IsDizzadle: boolean);
    function ReadFromIniFile(SectionName: string; ParamID: string): string;
  public
    config_path, DB_PATH : string;
    ConnectionString: string;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

function TMainForm.ReadFromIniFile(SectionName: string; ParamID: string): string;
  var
   IniFile : TIniFile;
begin
  IniFile          := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\' + 'config.ini');
  Result           := IniFile.ReadString(SectionName, ParamID, 'error');
  IniFile.Free;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
Memo.Lines.Add('Читаю настройки...');
Memo.Lines.Add('  Инифайл: '+ config_path);
Memo.Lines.Add('  FireBird БД : ' + DB_PATH);
Memo.Lines.Add('');

 ADOConnection.ConnectionString := ConnectionString;
 ADOConnection.Connected:= true;

  DM.DM_IE.ReadDataSet.SelectSQL.Clear;
  DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from Sys_options';
  DM.DM_IE.ReadDataSet.Open;
  DM.DM_IE.ReadDataSet.Close;
end;

procedure TMainForm.DizzableButtons(IsDizzadle: boolean);
begin
  cxButton2.Enabled := IsDizzadle;
  StartBtn.Enabled := IsDizzadle;
  RefreshBtn.Enabled := IsDizzadle;
  cxButton3.Enabled := IsDizzadle;
  cxButton1.Enabled := IsDizzadle;
  btnDepartments.Enabled := IsDizzadle;
end;

procedure TMainForm.UpdateGlobalProgress;
begin
  Global_Progress.Position:= Global_Progress.Position+ 1;
  Global_Progress.Update;
    if Global_Progress.Position = Global_Progress.Properties.Max then
     Memo.Lines.Add('Операция выполнена успешно!');
end;

procedure TMainForm.UpdateLocalProgress;
begin
  Local_Progress.Position:= Local_Progress.Position+ 1;
  Local_Progress.Update;
  if Local_Progress.Position = Local_Progress.Properties.Max then
     Memo.Lines.Text := Memo.Lines.Text + ' успешно!';
end;

procedure TMainForm.ProgressIni(PrBar : TcxProgressBar; MaxPos: integer;  Action: string);
begin
  PrBar.Position:= 0;
  PrBar.Properties.Max := MaxPos;
  PrBar.Update;
  Memo.Lines.Add(Action);
  Memo.Update;
end;


procedure TMainForm.StartBtnClick(Sender: TObject);
var i, j: integer;
begin
 try
   begin
     DizzableButtons(false);
      Screen.Cursor := crHourGlass;

       ProgressIni(Global_Progress,TablesCount, 'Выполняю импорт данных...');

       // должности [N_DOLG]
       ADOStoredProc.ProcedureName := 'vc_n_dolg_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_dolg_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_POST';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_dolg_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@REC_ID').Value := DM.DM_IE.ReadDataSet['ID_POST'];
          ADOStoredProc.Parameters.ParamByName('@KOD').Value := DM.DM_IE.ReadDataSet['ID_POST'];
          ADOStoredProc.Parameters.ParamByName('@NAME').Value :=DM.DM_IE.ReadDataSet['NAME'];
          ADOStoredProc.Parameters.ParamByName('@DOLSOKR').Value := DM.DM_IE.ReadDataSet['SNAME'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

       // основания работ [N_OR]
       ADOStoredProc.ProcedureName := 'vc_n_or_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_or_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_N_OR_UPLOAD';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_or_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@REC_ID').Value := DM.DM_IE.ReadDataSet['ID_WORK_REASON'];
          ADOStoredProc.Parameters.ParamByName('@SNOR').Value := DM.DM_IE.ReadDataSet['NAME_SHORT'];
          ADOStoredProc.Parameters.ParamByName('@PNOR').Value :=DM.DM_IE.ReadDataSet['NAME_FULL'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

       // особый признак(льгота) [N_OSP]
       ADOStoredProc.ProcedureName := 'vc_n_osp_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_osp_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from ASUP_UPLOAD_INVAL';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_osp_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@OSP').Value := DM.DM_IE.ReadDataSet['ID_INV'];
          ADOStoredProc.Parameters.ParamByName('@NAME').Value :=DM.DM_IE.ReadDataSet['NAME_INV'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

       // доплаты, надбавки [N_OSRDWR]
       ADOStoredProc.ProcedureName := 'vc_n_osrdwr_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_osrdwr_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_RAISE';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_osrdwr_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@VO').Value := DM.DM_IE.ReadDataSet['ID_RAISE'];
          ADOStoredProc.Parameters.ParamByName('@NAME').Value :=DM.DM_IE.ReadDataSet['NAME'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

       // семейное положение [N_SEMPOL]
       ADOStoredProc.ProcedureName := 'vc_n_sempol_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_sempol_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from ASUP_UPLOAD_MAR_STAT';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_sempol_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@SEMPOL').Value := DM.DM_IE.ReadDataSet['ID_FSTAT'];
          ADOStoredProc.Parameters.ParamByName('@NAMERUS').Value :=DM.DM_IE.ReadDataSet['NAME_FST'];
          ADOStoredProc.Parameters.ParamByName('@NAMEUKR').Value :=DM.DM_IE.ReadDataSet['NAME_FST'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

        // пенсии [N_VPENS]
       ADOStoredProc.ProcedureName := 'vc_n_vpens_deletet_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_vpens_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from ASUP_UPLOAD_PENSION';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_vpens_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@VPENS').Value := DM.DM_IE.ReadDataSet['ID_PENS'];
          ADOStoredProc.Parameters.ParamByName('@NAME_RUS').Value :=DM.DM_IE.ReadDataSet['NAME'];
          ADOStoredProc.Parameters.ParamByName('@NAME_UKR').Value :=DM.DM_IE.ReadDataSet['NAME'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

        // ВУЗы [N_VPENS]
       ADOStoredProc.ProcedureName := 'vc_n_vuz_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_vuz_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_EORG';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_vuz_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@SXE').Value := DM.DM_IE.ReadDataSet['NAME_SHORT'];
          ADOStoredProc.Parameters.ParamByName('@NXE').Value :=DM.DM_IE.ReadDataSet['NAME'];
          ADOStoredProc.Parameters.ParamByName('@VUZ').Value :=DM.DM_IE.ReadDataSet['ID_ORG'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

         // национальность [VOC5]
       ADOStoredProc.ProcedureName := 'vc_voc5_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_voc5_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from ASUP_UPLOAD_NATIONALITY';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_voc5_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@KOD').Value := DM.DM_IE.ReadDataSet['ID_NAT'];
          ADOStoredProc.Parameters.ParamByName('@NAME').Value :=DM.DM_IE.ReadDataSet['NAME_NAT'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

         // регалии [N_ZV]
       SetLength(RegardsParams, 5);
       RegardsParams[0] := 'AcademID';
       RegardsParams[1] := 'PochetID';
       RegardsParams[2] := 'SportID';
       RegardsParams[3] := 'VedNagrID';
       RegardsParams[4] := 'DergNagrID';

       ADOStoredProc.ProcedureName := 'vc_n_zv_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_zv_insert_import';
       ADOStoredProc.Parameters.Refresh;
       for j:=0 to Length(RegardsParams)-1 do
        begin
           DM.DM_IE.ReadDataSet.SelectSQL.Clear;
           DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_REGARDS_UPLOAD('+ ReadFromIniFile('VC_REGARDS', RegardsParams[j])+ ')';
           DM.DM_IE.ReadDataSet.Open;
           DM.DM_IE.ReadDataSet.FetchAll;
           ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_zv_insert_import...'+ RegardsParams[j]+'...');
           DM.DM_IE.ReadDataSet.First;
           for i:=0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
            begin
              ADOStoredProc.Parameters.ParamByName('@KOD').Value := DM.DM_IE.ReadDataSet['ID_REG'];
              ADOStoredProc.Parameters.ParamByName('@VZV').Value :=j+1;
              ADOStoredProc.Parameters.ParamByName('@NAME').Value :=DM.DM_IE.ReadDataSet['NAME'];
              ADOStoredProc.ExecProc;
              UpdateLocalProgress;
             DM.DM_IE.ReadDataSet.Next;
            end;
           DM.DM_IE.ReadDataSet.Close;
        end;
        UpdateGlobalProgress;

         // ученые звания [VOC6]
       ADOStoredProc.ProcedureName := 'vc_voc6_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_voc6_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_REGARDS_UPLOAD('+ ReadFromIniFile('VC_REGARDS','VchenZvanID')+ ')';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_voc6_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@KOD').Value   := DM.DM_IE.ReadDataSet['ID_REG'];
          ADOStoredProc.Parameters.ParamByName('@NAME').Value  := DM.DM_IE.ReadDataSet['NAME'];
          ADOStoredProc.Parameters.ParamByName('@SOKRN').Value := DM.DM_IE.ReadDataSet['SHORT_NAME'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

         // ученые степени [VOC7]
       ADOStoredProc.ProcedureName := 'vc_voc7_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_voc7_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_REGARDS_UPLOAD('+ ReadFromIniFile('VC_REGARDS','VchenStupID')+ ')';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_voc7_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@REC_ID').Value   := DM.DM_IE.ReadDataSet['ID_REG'];
          ADOStoredProc.Parameters.ParamByName('@NAME').Value     := DM.DM_IE.ReadDataSet['NAME'];
          ADOStoredProc.Parameters.ParamByName('@KOD').Value      := DM.DM_IE.ReadDataSet['SHORT_NAME'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

       Memo.Lines.Add('  Начинаю импорт физлиц...');
       Memo.Lines.Add('  Внимание! Забираю данные с сервера, процедура может занять некоторое время, не вмешивайтесь в процесс!');
         // пиплы [OSNSVED]
       ADOStoredProc.ProcedureName := 'vc_n_OSNSVED_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_OSNSVED_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_PEOPLE';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_OSNSVED_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@STATE').Value   := DM.DM_IE.ReadDataSet['STAT'];
          ADOStoredProc.Parameters.ParamByName('@VIDRAB').Value  := DM.DM_IE.ReadDataSet['ID_CATEGORY'];
          ADOStoredProc.Parameters.ParamByName('@NFIZL').Value   := DM.DM_IE.ReadDataSet['ID_MAN'];
          ADOStoredProc.Parameters.ParamByName('@NKAR').Value    := DM.DM_IE.ReadDataSet['ID_PCARD'];
          ADOStoredProc.Parameters.ParamByName('@FIO').Value     := DM.DM_IE.ReadDataSet['FIO_UKR'];
          ADOStoredProc.Parameters.ParamByName('@TN').Value      := DM.DM_IE.ReadDataSet['TN'];
          ADOStoredProc.Parameters.ParamByName('@OSP').Value     := DM.DM_IE.ReadDataSet['ID_INV'];
          ADOStoredProc.Parameters.ParamByName('@POL').Value     := DM.DM_IE.ReadDataSet['SEX'];
          ADOStoredProc.Parameters.ParamByName('@NAT').Value     := DM.DM_IE.ReadDataSet['ID_NAT'];
          ADOStoredProc.Parameters.ParamByName('@UST').Value     := DM.DM_IE.ReadDataSet['ID_REG_UCHSTEP'];
          ADOStoredProc.Parameters.ParamByName('@DATST').Value   := DM.DM_IE.ReadDataSet['DATE_BEG_UCHSTEP'];
          ADOStoredProc.Parameters.ParamByName('@UZV').Value     := DM.DM_IE.ReadDataSet['ID_REG_UCHZVAN'];
          ADOStoredProc.Parameters.ParamByName('@DATZV').Value   := DM.DM_IE.ReadDataSet['DATE_BEG_UCHZVAN'];
          ADOStoredProc.Parameters.ParamByName('@DPU').Value     := DM.DM_IE.ReadDataSet['DBEG'];
          ADOStoredProc.Parameters.ParamByName('@DUV').Value     := DM.DM_IE.ReadDataSet['DDISM'];
          ADOStoredProc.Parameters.ParamByName('@TIN').Value     := DM.DM_IE.ReadDataSet['TIN'];
          ADOStoredProc.Parameters.ParamByName('@DATA_RO').Value := DM.DM_IE.ReadDataSet['DBIRTH'];
          ADOStoredProc.Parameters.ParamByName('@SEMPOL').Value  := DM.DM_IE.ReadDataSet['ID_FSTAT'];
          ADOStoredProc.Parameters.ParamByName('@SVEDVUCH').Value:= null;
          Label2.Caption := vartostr(DM.DM_IE.ReadDataSet['ID_MAN']);
          Label2.Update;
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;
       Label2.Caption:= '-';

       // пенсия [R_PENS]
       ADOStoredProc.ProcedureName := 'vc_r_pens_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_r_pens_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_PENSION';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_r_pens_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@NKAR').Value := DM.DM_IE.ReadDataSet['ID_PCARD'];
          ADOStoredProc.Parameters.ParamByName('@VPENS').Value :=DM.DM_IE.ReadDataSet['ID_PENSION_TYPE'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

       // регалии [R_ZV]
       ADOStoredProc.ProcedureName := 'vc_r_zv_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_r_zv_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_MAN_REGARDS';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_r_zv_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@NKAR').Value := DM.DM_IE.ReadDataSet['ID_PCARD'];
          ADOStoredProc.Parameters.ParamByName('@VZV').Value :=DM.DM_IE.ReadDataSet['ID_REGARD'];
          ADOStoredProc.Parameters.ParamByName('@REC_ID').Value :=DM.DM_IE.ReadDataSet['ID_MAN_REGARD'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

       // дети [R_CHILD]
       ADOStoredProc.ProcedureName := 'vc_r_child_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_r_child_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_CHILDREN';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_r_child_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@REC_ID').Value := DM.DM_IE.ReadDataSet['REC_ID'];
          ADOStoredProc.Parameters.ParamByName('@NKAR').Value :=DM.DM_IE.ReadDataSet['ID_PCARD'];
          ADOStoredProc.Parameters.ParamByName('@KTO').Value :=DM.DM_IE.ReadDataSet['KTO'];
          ADOStoredProc.Parameters.ParamByName('@FIO').Value := DM.DM_IE.ReadDataSet['FIO'];
          ADOStoredProc.Parameters.ParamByName('@DATE').Value :=DM.DM_IE.ReadDataSet['DBIRTH'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

       // Кафедры (структурные подразделения) [N_PODR]
       ADOStoredProc.ProcedureName := 'vc_n_podr_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_podr_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_DEPARTMENT_BY_PROP(1)';
//       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_DEPARTMENT_BY_PROP('+ ReadFromIniFile('VC_DEPART','PodrPropID')+ ')';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_podr_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@KOD_SPODR').Value := DM.DM_IE.ReadDataSet['ID_DEPARTMENT'];
          ADOStoredProc.Parameters.ParamByName('@SXE').Value       := DM.DM_IE.ReadDataSet['ID_PARENT'];
          ADOStoredProc.Parameters.ParamByName('@NPODR').Value     := DM.DM_IE.ReadDataSet['NAME_FULL'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;

       UpdateGlobalProgress;

        // ВУЗы [N_VUZ]
       ADOStoredProc.ProcedureName := 'vc_n_vuz_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_vuz_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_DEPARTMENT_BY_PROP(3)';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_vuz_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@VUZ').Value := DM.DM_IE.ReadDataSet['ID_DEPARTMENT'];
          ADOStoredProc.Parameters.ParamByName('@SXE').Value := DM.DM_IE.ReadDataSet['NAME_SHORT'];
          ADOStoredProc.Parameters.ParamByName('@NXE').Value := DM.DM_IE.ReadDataSet['NAME_FULL'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

        // факультеты [N_XE]
       ADOStoredProc.ProcedureName := 'vc_n_xe_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_xe_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_DEPARTMENT_BY_PROP(2)';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_xe_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@SXE').Value := DM.DM_IE.ReadDataSet['ID_DEPARTMENT'];
          ADOStoredProc.Parameters.ParamByName('@NXE').Value := DM.DM_IE.ReadDataSet['NAME_FULL'];
          ADOStoredProc.Parameters.ParamByName('@VUZ').Value := DM.DM_IE.ReadDataSet['ID_PARENT'];
          ADOStoredProc.Parameters.ParamByName('@SHORT_NAME').Value := DM.DM_IE.ReadDataSet['NAME_SHORT'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

        // виды работников [N_VIDRAB]
       ADOStoredProc.ProcedureName := 'vc_n_vidrab_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_vidrab_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_CATEGORY';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_vidrab_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@KODP').Value := DM.DM_IE.ReadDataSet['ID_CATEGORY'];
          ADOStoredProc.Parameters.ParamByName('@NAME').Value := DM.DM_IE.ReadDataSet['NAME_CATEGORY'];
          ADOStoredProc.Parameters.ParamByName('@VIDRAB').Value := DM.DM_IE.ReadDataSet['SHORT_NAME_CATEGORY'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

        // назначения, карьера [R_MRAB]
       ADOStoredProc.ProcedureName := 'vc_R_MRAB_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_R_MRAB_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_R_MRAB';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_R_MRAB_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       Label3.Caption := 'ID_PCARD';
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@NRECNO').Value    := i+1;
          ADOStoredProc.Parameters.ParamByName('@NKAR').Value      := DM.DM_IE.ReadDataSet['ID_PCARD'];
           Label2.Caption := IntToStr(DM.DM_IE.ReadDataSet['ID_PCARD']);
           Label2.Update;
          ADOStoredProc.Parameters.ParamByName('@STATE').Value     := DM.DM_IE.ReadDataSet['STAT'];
          ADOStoredProc.Parameters.ParamByName('@VIDRAB').Value    := DM.DM_IE.ReadDataSet['ID_CATEGORY'];
          ADOStoredProc.Parameters.ParamByName('@VUZ').Value       := DM.DM_IE.ReadDataSet['ID_VUZ'];
          ADOStoredProc.Parameters.ParamByName('@SXE').Value       := DM.DM_IE.ReadDataSet['ID_PARENT'];
          ADOStoredProc.Parameters.ParamByName('@SPODR').Value     := DM.DM_IE.ReadDataSet['ID_DEPARTMENT'];
          ADOStoredProc.Parameters.ParamByName('@OSR').Value       := DM.DM_IE.ReadDataSet['ID_WORK_REASON'];
          ADOStoredProc.Parameters.ParamByName('@KOD').Value       := DM.DM_IE.ReadDataSet['ID_POST'];
          ADOStoredProc.Parameters.ParamByName('@RSTAV').Value     := DM.DM_IE.ReadDataSet['KOL_STAVOK'];
          ADOStoredProc.Parameters.ParamByName('@KCHAS').Value     := DM.DM_IE.ReadDataSet['KOL_HOURS'];
          ADOStoredProc.Parameters.ParamByName('@ND').Value        := DM.DM_IE.ReadDataSet['ND'];
          ADOStoredProc.Parameters.ParamByName('@PROCENT').Value   := DM.DM_IE.ReadDataSet['PERCENT'];
          ADOStoredProc.Parameters.ParamByName('@DATANOPL').Value  := DM.DM_IE.ReadDataSet['DATE_BEG'];
          ADOStoredProc.Parameters.ParamByName('@DATAKOPL').Value  := DM.DM_IE.ReadDataSet['REAL_DATE_END'];
          ADOStoredProc.Parameters.ParamByName('@VO').Value        := DM.DM_IE.ReadDataSet['ID_RAISE'];
          ADOStoredProc.Parameters.ParamByName('@PRZDOL').Value    := DM.DM_IE.ReadDataSet['IS_MAIN_POST'];
          ADOStoredProc.Parameters.ParamByName('@PRZDOLA').Value   := DM.DM_IE.ReadDataSet['PRZDOLA'];
          ADOStoredProc.Parameters.ParamByName('@DUV').Value       := DM.DM_IE.ReadDataSet['DDISM'];

          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;


      // физ лица [PEOPLE]
       ADOStoredProc.ProcedureName := 'vc_people_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_people_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_SP_PEOPLE';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       Label3.Caption := 'ID_MAN';
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_people_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@NFIZL').Value := DM.DM_IE.ReadDataSet['ID_MAN'];
          ADOStoredProc.Parameters.ParamByName('@TIN').Value := DM.DM_IE.ReadDataSet['TIN'];
          ADOStoredProc.Parameters.ParamByName('@FIO_RU').Value := DM.DM_IE.ReadDataSet['RUS_FAMILIA'];
          ADOStoredProc.Parameters.ParamByName('@IMYA_RU').Value := DM.DM_IE.ReadDataSet['RUS_IMYA'];
          ADOStoredProc.Parameters.ParamByName('@OTCHEST_RU').Value := DM.DM_IE.ReadDataSet['RUS_OTCHESTVO'];
          ADOStoredProc.Parameters.ParamByName('@FIO_UK').Value := DM.DM_IE.ReadDataSet['FAMILIA'];
          ADOStoredProc.Parameters.ParamByName('@IMYA_UK').Value := DM.DM_IE.ReadDataSet['IMYA'];
          ADOStoredProc.Parameters.ParamByName('@OTCHEST_UK').Value := DM.DM_IE.ReadDataSet['OTCHESTVO'];
          ADOStoredProc.Parameters.ParamByName('@DATE_RO').Value := DM.DM_IE.ReadDataSet['BIRTH_DATE'];
          ADOStoredProc.Parameters.ParamByName('@STAT').Value := DM.DM_IE.ReadDataSet['SEX'];
          ADOStoredProc.Parameters.ParamByName('@OBLAST_R').Value := DM.DM_IE.ReadDataSet['NAME_REGION_B'];
          ADOStoredProc.Parameters.ParamByName('@RAJON_R').Value := DM.DM_IE.ReadDataSet['NAME_DISTRICT_B'];
          ADOStoredProc.Parameters.ParamByName('@TYP_R').Value := DM.DM_IE.ReadDataSet['ID_PLACE_TYPE_B'];
          ADOStoredProc.Parameters.ParamByName('@NASPUNKT_R').Value := DM.DM_IE.ReadDataSet['NAME_PLACE_B'];
          ADOStoredProc.Parameters.ParamByName('@INDEKS_P').Value := DM.DM_IE.ReadDataSet['INDEX_L'];
          ADOStoredProc.Parameters.ParamByName('@OBLAST_P').Value := DM.DM_IE.ReadDataSet['NAME_REGION_L'];
          ADOStoredProc.Parameters.ParamByName('@RAJON_P').Value := DM.DM_IE.ReadDataSet['NAME_DISTRICT_L'];
          ADOStoredProc.Parameters.ParamByName('@TYP_P').Value := DM.DM_IE.ReadDataSet['ID_PLACE_TYPE_L'];
          ADOStoredProc.Parameters.ParamByName('@NASPUNKT_P').Value := DM.DM_IE.ReadDataSet['NAME_PLACE_L'];
          ADOStoredProc.Parameters.ParamByName('@TYP_VUL_P').Value := DM.DM_IE.ReadDataSet['ID_TYPE_STREET_L'];
          ADOStoredProc.Parameters.ParamByName('@VULYCIA_P').Value := DM.DM_IE.ReadDataSet['NAME_STREET_L'];
          ADOStoredProc.Parameters.ParamByName('@NOMDOM_P').Value := DM.DM_IE.ReadDataSet['HOUSE'];
          ADOStoredProc.Parameters.ParamByName('@KORP_P').Value := DM.DM_IE.ReadDataSet['KORPUS'];
          ADOStoredProc.Parameters.ParamByName('@KVART_P').Value := DM.DM_IE.ReadDataSet['FLAT'];
          ADOStoredProc.Parameters.ParamByName('@TEL_DOM').Value := DM.DM_IE.ReadDataSet['HOME_PHONE'];
          ADOStoredProc.Parameters.ParamByName('@TEL_RAB').Value := DM.DM_IE.ReadDataSet['WORK_PHONE'];
          ADOStoredProc.Parameters.ParamByName('@PAS_SER').Value := DM.DM_IE.ReadDataSet['SERIA'];
          ADOStoredProc.Parameters.ParamByName('@PAS_NUM').Value := DM.DM_IE.ReadDataSet['NUMBER'];
          ADOStoredProc.Parameters.ParamByName('@PAS_DATE').Value := DM.DM_IE.ReadDataSet['DATE_BEG'];
          ADOStoredProc.Parameters.ParamByName('@PAS_VIDAN').Value := DM.DM_IE.ReadDataSet['VIDAN'];
          ADOStoredProc.Parameters.ParamByName('@FIO').Value := DM.DM_IE.ReadDataSet['RUS_FIO_UPPER'];
          ADOStoredProc.Parameters.ParamByName('@UKRFIO').Value := DM.DM_IE.ReadDataSet['FIO_UPPER'];
          ADOStoredProc.Parameters.ParamByName('@KSTRAN').Value := DM.DM_IE.ReadDataSet['ID_COUNTRY_L'];
          ADOStoredProc.Parameters.ParamByName('@PAS_DOK').Value := DM.DM_IE.ReadDataSet['ID_PASS_TYPE'];
          ADOStoredProc.Parameters.ParamByName('@KSTRAN_R').Value := DM.DM_IE.ReadDataSet['ID_COUNTRY_B'];
          Label2.Caption := vartostr(DM.DM_IE.ReadDataSet['ID_MAN']);
          Label2.Update;
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;


        // тип населенного пункта [CITY]
       ADOStoredProc.ProcedureName := 'vc_city_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_city_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_TYPE_PLACE';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_city_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@KOD_CITY').Value   := DM.DM_IE.ReadDataSet['ID_TYPE_PLACE'];
          ADOStoredProc.Parameters.ParamByName('@NAME_CITY').Value  := DM.DM_IE.ReadDataSet['NAME_FULL'];
          ADOStoredProc.Parameters.ParamByName('@NAME_S_CIT').Value := DM.DM_IE.ReadDataSet['NAME_SHORT'];
          ADOStoredProc.Parameters.ParamByName('@PRI').Value        := DM.DM_IE.ReadDataSet['DORDER'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

         // тип улицы [street]
       ADOStoredProc.ProcedureName := 'vc_street_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_street_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_TYPE_STREET';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_street_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@KOD_STREET').Value   := DM.DM_IE.ReadDataSet['ID_TYPE_STREET'];
          ADOStoredProc.Parameters.ParamByName('@NAME_STREE').Value  := DM.DM_IE.ReadDataSet['NAME_FULL'];
          ADOStoredProc.Parameters.ParamByName('@NAME_S_STR').Value := DM.DM_IE.ReadDataSet['NAME_SHORT'];
          ADOStoredProc.Parameters.ParamByName('@PRI').Value        := DM.DM_IE.ReadDataSet['DORDER'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

       // тип удостоверения личности [N_PASP]
       ADOStoredProc.ProcedureName := 'vc_n_pasp_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_pasp_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_TYPE_PASS';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_pasp_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@PAS_DOK').Value   := DM.DM_IE.ReadDataSet['ID_PASS_TYPE'];
          ADOStoredProc.Parameters.ParamByName('@NPAS_DOK').Value  := DM.DM_IE.ReadDataSet['PASS_TYPE_NAME'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;


       // страны [N_STRAN]
       ADOStoredProc.ProcedureName := 'vc_n_stran_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_stran_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_ADR_COUNTRY';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_stran_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@ID_STRAN').Value   := DM.DM_IE.ReadDataSet['ID_COUNTRY'];
          ADOStoredProc.Parameters.ParamByName('@KSTRAN').Value     := DM.DM_IE.ReadDataSet['ID_COUNTRY'];
          ADOStoredProc.Parameters.ParamByName('@NSTRAN').Value     := DM.DM_IE.ReadDataSet['NAME_COUNTRY'];
          ADOStoredProc.Parameters.ParamByName('@NSTRAN_RU').Value  := DM.DM_IE.ReadDataSet['NAME_COUNTRY'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

       // пол [N_STAT]
       ADOStoredProc.ProcedureName := 'vc_n_stat_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_n_stat_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_INI_SEX';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_n_stat_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@ID_STAT').Value   := DM.DM_IE.ReadDataSet['ID_SEX'];
          ADOStoredProc.Parameters.ParamByName('@STAT').Value     := DM.DM_IE.ReadDataSet['SHORT_NAME'];
          ADOStoredProc.Parameters.ParamByName('@NSTAT').Value     := DM.DM_IE.ReadDataSet['FULL_NAME'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

       // области [S_OBLAST]
       ADOStoredProc.ProcedureName := 'vc_s_oblast_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_s_oblast_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_ADR_REGION';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_s_oblast_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@ID_OBL').Value   := DM.DM_IE.ReadDataSet['ID_REGION'];
          ADOStoredProc.Parameters.ParamByName('@OBLAST').Value   := DM.DM_IE.ReadDataSet['NAME_REGION'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;


       // районы [S_RAYON]
       ADOStoredProc.ProcedureName := 'vc_s_rayon_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_s_rayon_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_ADR_DISTRICT';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_s_rayon_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@ID_RAYON').Value   := DM.DM_IE.ReadDataSet['ID_DISTRICT'];
          ADOStoredProc.Parameters.ParamByName('@RAYON').Value      := DM.DM_IE.ReadDataSet['NAME_DISTRICT'];
          ADOStoredProc.Parameters.ParamByName('@ID_OBL').Value     := DM.DM_IE.ReadDataSet['ID_REGION'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;


       // населенные пункты [S_GOROD]
       ADOStoredProc.ProcedureName := 'vc_s_gorod_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_s_gorod_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_ADR_PLACE';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_s_gorod_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@ID_GOROD').Value   := DM.DM_IE.ReadDataSet['ID_PLACE'];
          ADOStoredProc.Parameters.ParamByName('@KOD_CITY').Value   := DM.DM_IE.ReadDataSet['ID_PLACE_TYPE'];
          ADOStoredProc.Parameters.ParamByName('@GOROD').Value      := DM.DM_IE.ReadDataSet['NAME_PLACE'];
          ADOStoredProc.Parameters.ParamByName('@ID_RAYON').Value   := DM.DM_IE.ReadDataSet['ID_DISTRICT'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;


        // районы города Донецк [S_RAYGOR]
       ADOStoredProc.ProcedureName := 'vc_s_raygor_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_s_raygor_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_ADR_CITY_AREA';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_s_raygor_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@ID_RAY_GOR').Value  := DM.DM_IE.ReadDataSet['ID_CITY_AREA'];
          ADOStoredProc.Parameters.ParamByName('@RAYON_GOR').Value   := DM.DM_IE.ReadDataSet['NAME_CITY_AREA'];
          ADOStoredProc.Parameters.ParamByName('@ID_RAYON').Value    := DM.DM_IE.ReadDataSet['ID_PLACE'];
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

        // улицы города Донецк [S_ULICYA]
       ADOStoredProc.ProcedureName := 'vc_s_ulicya_delete_import';
       ADOStoredProc.Parameters.Refresh;
       ADOStoredProc.ExecProc;

       ADOStoredProc.ProcedureName := 'vc_s_ulicya_insert_import';
       ADOStoredProc.Parameters.Refresh;
       DM.DM_IE.ReadDataSet.SelectSQL.Clear;
       DM.DM_IE.ReadDataSet.SelectSQL.Text := 'select * from VC_UPLOAD_ADR_STREET';
       DM.DM_IE.ReadDataSet.Open;
       DM.DM_IE.ReadDataSet.FetchAll;
       ProgressIni(Local_Progress,DM.DM_IE.ReadDataSet.RecordCount, ' Текущая процедура vc_s_ulicya_insert_import...');
       DM.DM_IE.ReadDataSet.First;
       for i:= 0 to DM.DM_IE.ReadDataSet.RecordCount-1 do
        begin
          ADOStoredProc.Parameters.ParamByName('@ID_UL').Value        := DM.DM_IE.ReadDataSet['ID_STREET'];
          ADOStoredProc.Parameters.ParamByName('@KOD_STREET').Value   := DM.DM_IE.ReadDataSet['ID_TYPE_STREET'];
          ADOStoredProc.Parameters.ParamByName('@ULICYA').Value       := DM.DM_IE.ReadDataSet['NAME_STREET'];
          ADOStoredProc.Parameters.ParamByName('@ULIC_RU').Value      := DM.DM_IE.ReadDataSet['NAME_STREET'];          
          ADOStoredProc.ExecProc;
          UpdateLocalProgress;
         DM.DM_IE.ReadDataSet.Next;
        end;
       DM.DM_IE.ReadDataSet.Close;
       UpdateGlobalProgress;

       DM.DM_IE.ReadDataSet.Transaction.Commit;

       DizzableButtons(true);
       Screen.Cursor := crDefault;
       Memo.Lines.Add('Всего обработано ' + IntToStr(TablesCount) + ' таблиц(а)');
       Showmessage('Импорт завершен упешно!');

      end;
 except
  Screen.Cursor := crDefault;
  cxButton3.Enabled:= True;
  Showmessage('Произошла ошибка! Обратитесь к администратору!');
 end;

 Screen.Cursor := crDefault;

end;

procedure TMainForm.cxButton2Click(Sender: TObject);
begin
 Screen.Cursor := crHourGlass;
 DizzableButtons(false);
 ProgressIni(Global_Progress,TablesCount, 'Удаление всех записей...');

 ADOStoredProc.ProcedureName := 'vc_n_dolg_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_n_or_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_n_osp_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_n_osrdwr_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;
 
 ADOStoredProc.ProcedureName := 'vc_n_sempol_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_n_vpens_deletet_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;
 
 ADOStoredProc.ProcedureName := 'vc_n_vuz_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_voc5_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_n_zv_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_voc6_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_voc7_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_n_OSNSVED_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_r_pens_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_n_zv_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_r_child_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_n_podr_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_n_vuz_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_n_xe_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;
 
 ADOStoredProc.ProcedureName := 'vc_n_vidrab_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;
 
 ADOStoredProc.ProcedureName := 'vc_R_MRAB_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_people_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_city_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_street_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_n_pasp_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_n_stran_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_n_stat_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

 ADOStoredProc.ProcedureName := 'vc_s_oblast_delete_import';
 ADOStoredProc.Parameters.Refresh;
 ADOStoredProc.ExecProc;
 UpdateGlobalProgress;

  ADOStoredProc.ProcedureName := 'vc_s_rayon_delete_import';
  ADOStoredProc.Parameters.Refresh;
  ADOStoredProc.ExecProc;
  UpdateGlobalProgress;

   ADOStoredProc.ProcedureName := 'vc_s_gorod_delete_import';
   ADOStoredProc.Parameters.Refresh;
   ADOStoredProc.ExecProc;
   UpdateGlobalProgress;


   ADOStoredProc.ProcedureName := 'vc_s_raygor_delete_import';
   ADOStoredProc.Parameters.Refresh;
   ADOStoredProc.ExecProc;
   UpdateGlobalProgress;

   ADOStoredProc.ProcedureName := 'vc_s_ulicya_delete_import';
   ADOStoredProc.Parameters.Refresh;
   ADOStoredProc.ExecProc;
   UpdateGlobalProgress;

 DizzableButtons(true);
 Screen.Cursor := crDefault;
end;

procedure TMainForm.cxButton3Click(Sender: TObject);
begin
close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
 TablesCount := 31;
end;

procedure TMainForm.RefreshBtnClick(Sender: TObject);
begin
Memo.Clear;
end;

procedure TMainForm.cxButton1Click(Sender: TObject);
var frmBonus : TfrmBonus;
begin
frmBonus := TfrmBonus.Create(self, Dm.DM_IE.DB.Handle);
frmBonus.ShowModal;
end;

procedure TMainForm.btnDepartmentsClick(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(Dm.DM_IE.DB.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 1;
                // единичная выборка
            FieldValues['Select'] := 1;
            FieldValues['AllowEdit'] := true;
            Post;
        end;
    end;
        // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
    if sp.Output = nil then
        ShowMessage('BUG: Output is NIL!!!');
    sp.Free;
end;

end.
