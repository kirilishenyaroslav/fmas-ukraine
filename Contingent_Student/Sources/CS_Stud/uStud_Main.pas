unit uStud_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  cxClasses, ImgList, ExtCtrls,ib_externals, uCs_types,
  uCS_Loader,
  cxDropDownEdit, cxCalendar, dxBar, dxBarExtItems, cxTextEdit, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxContainer, cxLabel,
  cxDBLabel, ActnList, cxCheckBox, cxLookAndFeelPainters, StdCtrls,
  cxButtons;//SysUtils,StdCtrls;

type
  TfmStudMain = class(TForm)

    PanelFiltr: TPanel;
    PanelInfo: TPanel;
    PanelGrid: TPanel;
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
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn_PIB: TcxGridDBColumn;
    cxGridDBColumn_birthday: TcxGridDBColumn;
    cxGridDBColumnname_Spec: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableViewKurs: TcxGridDBColumn;
    cxGridDBTableView2DBPeriod: TcxGridDBColumn;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    lblFak: TcxLabel;
    FaculBox: TcxLookupComboBox;
    cxGroup: TcxLabel;
    GroupBox: TcxLookupComboBox;
    LbSpec: TcxLabel;
    SpecBox: TcxLookupComboBox;
    cxLabel3: TcxLabel;
    FormEducBox: TcxLookupComboBox;
    cxLabel4: TcxLabel;
    KursBox: TcxLookupComboBox;
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
    DateBegLabel: TcxLabel;
    DateBegEdit: TcxDateEdit;
    DateEndEdit: TcxDateEdit;
    DBLabelFak: TcxDBLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    DBLabelGroup: TcxDBLabel;
    cxLabel5: TcxLabel;
    DBLabelFormEduc: TcxDBLabel;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    ShowBtn: TdxBarLargeButton;
    cxLabel6: TcxLabel;
    TextEditFIO: TcxTextEdit;
    ActionList1: TActionList;
    ActionShow: TAction;
    ActionFilter: TAction;
    ActionClose: TAction;
    ActionClear: TAction;
    SelButton: TdxBarLargeButton;
    ActionSel: TAction;
    cxGridDBTableViewCheck: TcxGridDBColumn;
    KatLabel: TcxLabel;
    KatBox: TcxLookupComboBox;
    ButtonCheckAll: TdxBarLargeButton;
    ButtonUnchackAll: TdxBarLargeButton;
    ActionCheckAll: TAction;
    ActionUncheckAll: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure ActionShowExecute(Sender: TObject);
    procedure ActionFilterExecute(Sender: TObject);
    procedure ActionClearExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpecBoxPropertiesCloseUp(Sender: TObject);
    procedure SpecBoxPropertiesEditValueChanged(Sender: TObject);
    procedure ActionSelExecute(Sender: TObject);
    procedure ActionUncheckAllExecute(Sender: TObject);
    procedure ActionCheckAllExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    IndLangVWF       :Integer;
    TextViewColorVWF :TColor;
    key_spec : String;
    key_okr  :  integer;
  public
    res:Variant;
    procedure LoadFilter;
    constructor  Create(AParameter:TcsParamPacks);reintroduce;
  end;

var
  fmStudMain: TfmStudMain;

implementation

uses DM_Stud;

{$R *.dfm}

constructor TfmStudMain.Create(AParameter:TcsParamPacks);
begin
  Screen.Cursor := crHourGlass;

  inherited Create(AParameter.Owner);

  DM := TDM.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected := True;

  FaculBox.EditValue         := (null);
  SpecBox.EditValue          := (null);
  GroupBox.EditValue         := (null);
  FormEducBox.EditValue      := (null);
  KursBox.EditValue          := (null);

  DateBegEdit.Date           := date;
  DateEndEdit.Date           := date;

  DBLabelFak.Visible         := false;
  DBLabelGroup.Visible       := false;
  DBLabelFormEduc.Visible    := false;

  cxGridDBTableView2.DataController.DataSource      := DM.DataSourceStud;
  DBLabelFak.DataBinding.DataSource                 := DM.DataSourceStud;
  DBLabelGroup.DataBinding.DataSource               := DM.DataSourceStud;
  DBLabelFormEduc.DataBinding.DataSource            := DM.DataSourceStud;
  LoadFilter;

  Screen.Cursor:=crDefault;
end;

procedure TfmStudMain.LoadFilter;
begin

   FaculBox.Properties.ListSource:=DM.DataSourceFacul;
   DM.DataSetFacul.Close;
   DM.DataSetFacul.SQLs.SelectSQL.Text := 'SELECT * FROM CN_WEB_SP_FACUL_LINK_EDBO_SEL';
   DM.DataSetFacul.Open;
   FaculBox.Properties.KeyFieldNames  := 'id_facul';
   FaculBox.Properties.ListFieldNames := 'name_facul';

   SpecBox.Properties.ListSource:=DM.DataSourceSpec;
   DM.DataSetSpec.Close;
   DM.DataSetSpec.SQLs.SelectSQL.Text := 'SELECT distinct ID_SPEC, NAME_SPEC from CN_WEB_SP_SPEC_LINK_EDBO_SEL order by name_spec';
   DM.DataSetSpec.Open;
   SpecBox.Properties.KeyFieldNames  := 'id_spec';
   SpecBox.Properties.ListFieldNames := 'name_spec';

   GroupBox.Properties.ListSource:=DM.DataSourceGroup;
   DM.DataSetGroup.Close;
   DM.DataSetGroup.SQLs.SelectSQL.Text := 'SELECT distinct FID_UNIVERSITYGROUP,FUNIVERSITYGROUPFULLNAME FROM CN_WEB_SP_GROUP_LINK_EDBO';
   DM.DataSetGroup.Open;
   GroupBox.Properties.KeyFieldNames  := 'FID_UNIVERSITYGROUP';
   GroupBox.Properties.ListFieldNames := 'FUNIVERSITYGROUPFULLNAME';

   FormEducBox.Properties.ListSource:=DM.DataSourceFormEduc;
   DM.DataSetFormEduc.Close;
   DM.DataSetFormEduc.SQLs.SelectSQL.Text := 'SELECT distinct ID_FORM_STUD,NAME_FORM_STUD FROM CN_WEB_SP_OKR_LINK_EDBO_SEL order by NAME_FORM_STUD';
   DM.DataSetFormEduc.Open;
   FormEducBox.Properties.KeyFieldNames  := 'ID_FORM_STUD';
   FormEducBox.Properties.ListFieldNames := 'NAME_FORM_STUD';

   KatBox.Properties.ListSource:=DM.DataSourceKat;
   DM.DataSetKat.SQLs.SelectSQL.Text := 'SELECT distinct ID_KAT_STUD,NAME_KAT_STUD  FROM CN_WEB_SP_OKR_LINK_EDBO_SEL order by NAME_KAT_STUD';
   DM.DataSetKat.Open;
   KatBox.Properties.KeyFieldNames  := 'ID_KAT_STUD';
   KatBox.Properties.ListFieldNames := 'NAME_KAT_STUD';

   KursBox.Properties.ListSource:=DM.DataSourceKurs;
   DM.DataSetKurs.Close;
   DM.DataSetKurs.SQLs.SelectSQL.Text := 'SELECT distinct ID_KURS_EDBO,NAME_Kurs FROM CN_WEB_SP_KURS_LINK_EDBO';
   DM.DataSetKurs.Open;
   KursBox.Properties.KeyFieldNames  := 'ID_KURS_EDBO';
   KursBox.Properties.ListFieldNames := 'NAME_Kurs';
end;


procedure TfmStudMain.ExitButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfmStudMain.ActionShowExecute(Sender: TObject);
var
    AParameter : TcsParamPacks;
begin
if not dm.DataSetStud.IsEmpty then
    begin
        AParameter := TcsParamPacks.Create;
        AParameter.Owner := self;
        AParameter.Db_Handle := DM.DB.Handle;
        AParameter.Formstyle := fsNormal;
        AParameter.ID_Locate := DM.MemoryDataStud['ID_MAN'];
        AParameter.ID_Locate_1 := DM.MemoryDataStud['ID_PERSON_EDUCATION'];
        DoFunctionFromPackage(AParameter, ['Contingent_Student\Cs_PrivateCard.bpl','ShowCsStudPrivateCard']);

       // DM.DataSetStud.CloseOpen(True);
        DM.MemoryDataStud.Locate('ID_PERSON_EDUCATION',DM.MemoryDataStud['ID_PERSON_EDUCATION'],[loCaseInsensitive]);

        AParameter.Free;
    end;
end;

procedure TfmStudMain.ActionFilterExecute(Sender: TObject);
var strFilter:string;
    FDate:TDate;
begin
    DBLabelFak.Visible         := true;
    DBLabelGroup.Visible       := true;
    DBLabelFormEduc.Visible    := true;
    strFilter:='';

   if(FaculBox.Text= '') then FaculBox.EditValue       := null;
   if(SpecBox.Text= '') then SpecBox.EditValue         := null;
   if(GroupBox.Text= '') then GroupBox.EditValue       := null;
   if(KursBox.Text= '') then KursBox.EditValue         := null;
   if(FormEducBox.Text= '') then FormEducBox.EditValue := null;
   if(KatBox.Text= '') then KatBox.EditValue := null;

   if VarIsNull(FaculBox.EditValue) then strFilter:='Null,'
      else strFilter:=strFilter+IntToStr(FaculBox.EditValue)+',';

   if VarIsNull(SpecBox.EditValue) then strFilter:=strFilter+'Null, '
      else strFilter:=strFilter+IntToStr(SpecBox.EditValue)+',';

   if VarIsNull(KatBox.EditValue) then strFilter:=strFilter+'Null, '
      else strFilter:=strFilter+IntToStr(KatBox.EditValue)+',';

   if VarIsNull(GroupBox.EditValue) then strFilter:=strFilter+'Null,'
      else strFilter:=strFilter+IntToStr(GroupBox.EditValue)+',';

   if VarIsNull(KursBox.EditValue) then strFilter:=strFilter+'Null,'
       else strFilter:=strFilter+IntToStr(KursBox.EditValue)+',';

   if (VarIsNull(FormEducBox.EditValue))  then strFilter:=strFilter+'Null,'
       else strFilter:=strFilter+IntToStr(FormEducBox.EditValue)+',';

   if TextEditFIO.Text='' then strFilter:=strFilter+'Null,'
       else strFilter:=strFilter+''''+TextEditFIO.Text+''',';

   if DateBegEdit.Text='' then
   begin
       showmessage('Необхідно ввести початок періоду!');
       exit;
   end
   else strFilter:=strFilter+''''+DateToStr(DateBegEdit.Date)+''',';

   if DateEndEdit.Text='' then
   begin
       showmessage('Необхідно ввести кінець періоду!');
       exit;
   end
   else strFilter:=strFilter+''''+DateToStr(DateEndEdit.Date)+'''';

 //  Showmessage('Last: '+strFilter);

   if DM.DataSetStud.Active then DM.DataSetStud.Close;
   DM.DataSetStud.SQLs.SelectSQL.Text:='select distinct * from CS_STUD_FILTER('+strFilter+') order by FIO desc';
   DM.DataSetStud.Open;
   DM.DataSetStud.fetchAll;
   DM.DataSetStud.First;

   DM.MemoryDataStud.Close;
   DM.MemoryDataStud.EmptyTable;
   DM.MemoryDataStud.Open;

   while not DM.DataSetStud.Eof do
   begin
    DM.MemoryDataStud.Insert;
          DM.MemoryDataStud.FieldByName('Check').AsVariant                    := 0;
          DM.MemoryDataStud.FieldByName('id_person_education').AsVariant      := DM.DataSetStud['id_person_education'];
          DM.MemoryDataStud.FieldByName('FIO').AsVariant                      := DM.DataSetStud['FIO'];
          DM.MemoryDataStud.FieldByName('id_educ_options').AsVariant          := DM.DataSetStud['id_educ_options'];
          DM.MemoryDataStud.FieldByName('name_group').AsVariant               := DM.DataSetStud['name_group'];
          DM.MemoryDataStud.FieldByName('birth_date').AsVariant               := DM.DataSetStud['birth_date'];
          DM.MemoryDataStud.FieldByName('name_spec').AsVariant                := DM.DataSetStud['name_spec'];
          DM.MemoryDataStud.FieldByName('name_kurs').AsVariant                := DM.DataSetStud['name_kurs'];
          DM.MemoryDataStud.FieldByName('date_beg').AsVariant                 := DM.DataSetStud['date_beg'];
          DM.MemoryDataStud.FieldByName('date_end').AsVariant                 := DM.DataSetStud['date_end'];
          DM.MemoryDataStud.FieldByName('name_facul').AsVariant               := DM.DataSetStud['name_facul'];
          DM.MemoryDataStud.FieldByName('name_form_stud').AsVariant           := DM.DataSetStud['name_form_stud'];
          DM.MemoryDataStud.FieldByName('id_university_group').AsVariant      := DM.DataSetStud['id_university_group'];
          DM.MemoryDataStud.FieldByName('id_man').AsVariant                   := DM.DataSetStud['id_man'];
          DM.MemoryDataStud.Post;

          DM.DataSetStud.Next;
   end;
end;


procedure TfmStudMain.ActionClearExecute(Sender: TObject);
begin
   DM.MemoryDataStud.Close;
   DM.MemoryDataStud.EmptyTable;
   FaculBox.EditValue    := null;
   SpecBox.EditValue     := null;
   GroupBox.EditValue    := null;
   KursBox.EditValue     := null;
   FormEducBox.EditValue := null;
   KatBox.EditValue      := null;
   DateBegEdit.EditValue := date;
   DateEndEdit.EditValue := date;
   TextEditFIO.Text      := '';
   DBLabelFak.Visible         := false;
   DBLabelGroup.Visible       := false;
   DBLabelFormEduc.Visible    := false;
end;

procedure TfmStudMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TfmStudMain.SpecBoxPropertiesCloseUp(Sender: TObject);
var
  v: variant;
begin
  v := SpecBox.EditValue;
  if VarIsArray(v) then
  begin
      key_spec := v[0];
      key_okr  := v[1];
  end;
end;

procedure TfmStudMain.SpecBoxPropertiesEditValueChanged(Sender: TObject);
begin
 //showmessage(DM.DataSetSpec['kod_spec_edbo']);
end;

procedure TfmStudMain.ActionSelExecute(Sender: TObject);
   var i:integer;
begin
    i:=0;
    DM.MemoryDataStud.First;
    while not(DM.MemoryDataStud.Eof)do
    begin
      if(DM.MemoryDataStud['check']=1) and (DM.MemoryDataStud['check']<>0) then
        i:=i+1;
        DM.MemoryDataStud.Next;
    end;
    if(i<>0)then
    begin
        Res:=VarArrayCreate([0,i],varVariant);
        DM.MemoryDataStud.First;
        i:=0;
        while not(DM.MemoryDataStud.Eof)do
        begin
           if(DM.MemoryDataStud['check']=1) then
           begin
               Res[i] := VarArrayOf([DM.MemoryDataStud.FieldByName('id_person_education').AsVariant,
                                   DM.MemoryDataStud.FieldByName('FIO').AsVariant,
                                   DM.MemoryDataStud.FieldByName('id_educ_options').AsVariant,
                                   DM.MemoryDataStud.FieldByName('id_university_group').AsVariant,
                                   DM.MemoryDataStud.FieldByName('name_group').AsVariant]);
               i      := i+1;
           end;
         DM.MemoryDataStud.Next;
         end;
         ModalResult:=mrYes;
    end
    else
    ShowMessage('Не обрано студента');
end;

procedure TfmStudMain.ActionUncheckAllExecute(Sender: TObject);
begin
      if DM.MemoryDataStud.IsEmpty then exit;
      DM.MemoryDataStud.First;
      While not DM.MemoryDataStud.Eof do
      begin
         DM.MemoryDataStud.Edit;
         DM.MemoryDataStud.FieldByName('Check').AsVariant := 0;
         DM.MemoryDataStud.Post;
         DM.MemoryDataStud.Next;
      end;
end;

procedure TfmStudMain.ActionCheckAllExecute(Sender: TObject);
begin
      if DM.MemoryDataStud.IsEmpty then exit;
      DM.MemoryDataStud.First;
      While not DM.MemoryDataStud.Eof do
      begin
         DM.MemoryDataStud.Edit;
         DM.MemoryDataStud.FieldByName('Check').AsVariant := 1;
         DM.MemoryDataStud.Post;
         DM.MemoryDataStud.Next;
      end;
end;

procedure TfmStudMain.cxButton1Click(Sender: TObject);
begin
   TextEditFIO.Text      := '';
end;

procedure TfmStudMain.cxButton2Click(Sender: TObject);
begin
   FaculBox.EditValue    := null;
   DBLabelFak.Visible         := false;
end;

procedure TfmStudMain.cxButton4Click(Sender: TObject);
begin
   GroupBox.EditValue    := null;
   DBLabelGroup.Visible       := false;
end;

procedure TfmStudMain.cxButton6Click(Sender: TObject);
begin
   KatBox.EditValue      := null;
end;

procedure TfmStudMain.cxButton5Click(Sender: TObject);
begin
   SpecBox.EditValue     := null;
end;

procedure TfmStudMain.cxButton7Click(Sender: TObject);
begin
   KursBox.EditValue     := null;
end;

procedure TfmStudMain.cxButton8Click(Sender: TObject);
begin
   DateBegEdit.EditValue := date;
   DateEndEdit.EditValue := date;
end;

procedure TfmStudMain.cxButton3Click(Sender: TObject);
begin
   FormEducBox.EditValue := null;
   DBLabelFormEduc.Visible    := false;
end;

end.
