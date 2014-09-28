unit uSelected_param_edbo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, cxClasses, ImgList, Placemnt, iBase, DM,
  RxMemDS, AppStruClasses;

type
  Tfrm_selected_param_edbo = class(TForm)
    Panel1: TPanel;
    fio_label: TcxLabel;
    birthday_label: TcxLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    cxButton1: TcxButton;
    Button_OK: TcxButton;
    Panel4: TPanel;
    name_Fio_LabeL: TcxLabel;
    birthDay_name_Label: TcxLabel;
    CnFormStorage: TFormStorage;
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
    cxGrid4: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    cxGridDBTableView4DBColumn1: TcxGridDBColumn;
    cxGridDBTableView4DBColumn2: TcxGridDBColumn;
    cxGridDBTableView4DBColumn4: TcxGridDBColumn;
    cxGridDBTableView4DBColumn5: TcxGridDBColumn;
    DataSource_param: TDataSource;
    MemoryData_param: TRxMemoryData;
    MemoryData_param_edbo: TRxMemoryData;
    MemoryData_paramid_facul: TIntegerField;
    MemoryData_paramname_facul: TStringField;
    MemoryData_paramid_spec: TIntegerField;
    MemoryData_paramname_spec: TStringField;
    MemoryData_paramid_form_stud: TIntegerField;
    MemoryData_paramname_form_stud: TStringField;
    MemoryData_paramid_kat_stud: TIntegerField;
    MemoryData_paramname_kat_stud: TStringField;
    MemoryData_paramID_STUD_OPTIONS: TIntegerField;
    cxGridDBTableView4DBColumn3: TcxGridDBColumn;
    cxGridDBTableView4DBColumn6: TcxGridDBColumn;
    MemoryData_paramkurs: TIntegerField;
    MemoryData_paramterm_stud: TFloatField;
    MemoryData_paramfcodeofbusiness: TStringField;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button_OKClick(Sender: TObject);
    procedure cxGridDBTableView4DblClick(Sender: TObject);
  private
    DM_modul : TDM_Contracts;
    DB_handle : TISC_DB_HANDLE;
    EDBOGuidesIntf: TFMASAppModule;
    PERSON_CODE_U_EDBO : string;
  public
    id_man : int64;
    id_facul, id_spec, id_form_stud, id_kat_stud, id_group, id_national : Int64;
    name_facul, name_spec, name_form_stud, name_kat_stud, name_group, name_national : string;
    kurs: Integer;
    term_stud : Double;
    num_dog : string;
    constructor create(aOwner : TComponent; aDB_Handle : TISC_DB_HANDLE);overload;
  end;

var
  frm_selected_param_edbo: Tfrm_selected_param_edbo;

implementation

{$R *.dfm}

constructor Tfrm_selected_param_edbo.create(aOwner: TComponent;
  aDB_Handle: TISC_DB_HANDLE);
var
 path_str : string;  
begin
  inherited create(aOwner);

  DB_handle := aDB_Handle;

  DM_modul := TDM_Contracts.Create(self);
  DM_modul.DB.Handle := aDB_Handle;
  DM_modul.DB.Connected := true;
  DM_modul.ReadTransaction.StartTransaction;

  with TFMASAppModuleCreator.Create do
   begin
    path_str:=ExtractFilePath(Application.ExeName) + 'Contingent_Student\';

    //Экземпляр для работы с веб-сервисом EDBOGuides
    EDBOGuidesIntf:= CreateFMASModule(path_str, 'EDBOIntf');
    if (EDBOGuidesIntf=nil)
     then MessageBox(self.Handle, 'Помилка при роботі з модулем взаємодії з ЄДЕБО', 'Увага!', MB_OK or MB_ICONWARNING);
   end;
end;

procedure Tfrm_selected_param_edbo.cxButton1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_selected_param_edbo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM_modul.Free;
end;

procedure Tfrm_selected_param_edbo.FormShow(Sender: TObject);
var
  PCU:AnsiString;
  PRS, Id_PersonRequestStatusType1 :Integer; //какой тип 7 или другой?
  i : Integer;
begin
  DM_modul.DataSet.Close;
  DM_modul.DataSet.SQLs.SelectSQL.Text := 'select p.FAMILIA||'' ''||p.imya||'' ''||p.otchestvo as FIO, p.birth_date, p.PERSON_CODE_U_EDBO  from people p  where id_man = :id_man';
  DM_modul.DataSet.ParamByName('ID_MAN').AsInt64 := id_man;
  DM_modul.DataSet.Open;

  if DM_modul.DataSet['FIO'] <> null
   then name_Fio_LabeL.Caption := DM_modul.DataSet['FIO']
   else name_Fio_LabeL.Caption := '';

  if DM_modul.DataSet['birth_date'] <> null
   then birthDay_name_Label.Caption := DM_modul.DataSet['birth_date']
   else birthDay_name_Label.Caption := '';

  If DM_modul.DataSet['PERSON_CODE_U_EDBO'] <> null then
   begin
    PERSON_CODE_U_EDBO := DM_modul.DataSet['PERSON_CODE_U_EDBO'];

    if (EDBOGuidesIntf as IEDBOTools).InitEDBOConnection('EDBOGuides', DB_handle) then
     begin
     DM_modul.DataSet.Close;
     DM_modul.DataSet.SQLs.SelectSQL.Text := 'SELECT ID_SEASON FROM CN_WEB_INI';
     DM_modul.DataSet.Open;

     PRS := DM_modul.DataSet['ID_SEASON'];      //Идентификатор приемной компании
     EDBOGuidesIntf.InParams.Items['PRS'] := PInteger(@PRS);

     Id_PersonRequestStatusType1 := 0; //Идентификатор типа статуса -типа подтвержденные заявки
     EDBOGuidesIntf.InParams.Items['Id_PersonRequestStatusType1'] := PInteger(@Id_PersonRequestStatusType1);

     PCU:=PERSON_CODE_U_EDBO; //Код физлица - параметр не обязательный!!!!!
     EDBOGuidesIntf.InParams.Items['PCU']:=PAnsiString(@PCU);

     (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('UniversityFacultetsGetRequests',MemoryData_param_edbo);

      MemoryData_param.Open;
      MemoryData_param_edbo.Open;
      MemoryData_param_edbo.First;
      For i := 0 to MemoryData_param_edbo.RecordCount - 1 do
       Begin
        DM_modul.DataSet.Close;
        DM_modul.DataSet.SQLs.SelectSQL.Text := 'select * from CN_CONVER_ID_EDBO(:kod_EDBO_FACUL, :KOD_EDBO_SPEC, :ID_EDBO_FORM_STUD, :ID_EDBO_KAT_STUD, null, null, null, null, null)';
        DM_modul.DataSet.ParamByName('kod_EDBO_FACUL').Asstring := MemoryData_param_edbo['fUniversityFacultetKode'];
        DM_modul.DataSet.ParamByName('KOD_EDBO_SPEC').AsString := MemoryData_param_edbo['fSpecCode'];
        DM_modul.DataSet.ParamByName('ID_EDBO_FORM_STUD').AsInt64 := MemoryData_param_edbo['fid_personeducationForm'];
        DM_modul.DataSet.ParamByName('ID_EDBO_KAT_STUD').AsInt64 := MemoryData_param_edbo['fId_Qualification'];
        DM_modul.DataSet.Open;

        MemoryData_param.Insert;
        MemoryData_param['id_facul']        := DM_modul.DataSet['id_facul'];
        MemoryData_param['name_facul']      := DM_modul.DataSet['name_facul'];
        MemoryData_param['id_spec']         := DM_modul.DataSet['id_spec'];
        MemoryData_param['name_spec']       := DM_modul.DataSet['name_spec'];
        MemoryData_param['id_form_stud']    := DM_modul.DataSet['id_form_stud'];
        MemoryData_param['name_form_stud']  := DM_modul.DataSet['name_form_stud'];
        MemoryData_param['id_kat_stud']     := DM_modul.DataSet['id_kat_stud'];
        MemoryData_param['name_kat_stud']   := DM_modul.DataSet['name_kat_stud'];
        MemoryData_param['kurs']            := DM_modul.DataSet['kurs'];
        MemoryData_param['term_stud']       := DM_modul.DataSet['term_stud'];
        MemoryData_param['fCodeOfBusiness'] := MemoryData_param_edbo['fCodeOfBusiness'];

        MemoryData_param.post;

        MemoryData_param_edbo.Next;
       end;
     End;
   End;
end;

procedure Tfrm_selected_param_edbo.Button_OKClick(Sender: TObject);
begin
  if MemoryData_param.RecordCount = 0 then
   begin
    ShowMessage('Немає жодного параметру навчання!');
    Exit;
   end;

  if MemoryData_param['id_facul'] <> null
   then id_facul := MemoryData_param['id_facul']
   else id_facul := -1;

  DM_modul.DataSet.Close;
  DM_modul.DataSet.sqls.SelectSQL.Text := 'select p.id_group, p.name from cn_sp_group p where p.id_facul = :id_facul and p.is_def = 1';
  DM_modul.DataSet.ParamByName('ID_FACUL').AsInt64 := id_facul;
  DM_modul.DataSet.Open;

  if DM_modul.DataSet['id_group'] <> null
   then id_group := DM_modul.DataSet['id_group'];

  if MemoryData_param['id_spec'] <> null
   then id_spec := MemoryData_param['id_spec'];

  if MemoryData_param['id_form_stud'] <> null
   then id_form_stud := MemoryData_param['id_form_stud'];

  if MemoryData_param['id_kat_stud'] <> null
   then id_kat_stud := MemoryData_param['id_kat_stud'];

  id_national := 1; //Украина

  name_facul     := MemoryData_param['name_facul'];
  name_spec      := MemoryData_param['name_spec'];
  name_form_stud := MemoryData_param['name_form_stud'];
  name_kat_stud  := MemoryData_param['name_kat_stud'];
  name_national  := 'Громадянство України';

  if DM_modul.DataSet['name'] <> null
   then name_group := DM_modul.DataSet['name']
   else name_group := '';

  if MemoryData_param['kurs'] <> null
   then kurs := MemoryData_param['kurs']
   else kurs := 1;

  if  MemoryData_param['term_stud'] <> null
   then term_stud := MemoryData_param['term_stud']
   else term_stud := 4;

  num_dog := MemoryData_param['fCodeOfBusiness'];

  ModalResult := mrOk;
end;

procedure Tfrm_selected_param_edbo.cxGridDBTableView4DblClick(
  Sender: TObject);
begin
  Button_OKClick(self);
end;

end.
