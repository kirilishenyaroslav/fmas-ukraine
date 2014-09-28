unit Test;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AppStruClasses, DB, RxMemDS, accmgmt, Ibase, Grids,
  DBGrids, ExtCtrls, ComCtrls, InvokeRegistry, Rio, SOAPHTTPClient, xmldom,
  XMLIntf, msxmldom, XMLDoc, DBCtrls, EncdDecd, jpeg;

type
  TTestUnitForm = class(TForm)
    RxMemoryData: TRxMemoryData;
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Panel3: TPanel;
    Button9: TButton;
    Button8: TButton;
    Button3: TButton;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    RxMemoryData1: TRxMemoryData;
    DataSource2: TDataSource;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit5: TEdit;
    Edit8: TEdit;
    Button21: TButton;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Button22: TButton;
    Button23: TButton;
    Edit9: TEdit;
    Button25: TButton;
    Button26: TButton;
    Edit11: TEdit;
    Edit12: TEdit;
    Button27: TButton;
    Button28: TButton;
    Edit13: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit14: TEdit;
    Button29: TButton;
    Label3: TLabel;
    Edit15: TEdit;
    Button31: TButton;
    Button32: TButton;
    Edit17: TEdit;
    Label4: TLabel;
    Edit18: TEdit;
    Button42: TButton;
    Edit10: TEdit;
    Button24: TButton;
    Label5: TLabel;
    Edit19: TEdit;
    Button33: TButton;
    Edit20: TEdit;
    Edit21: TEdit;
    TabSheet3: TTabSheet;
    Button34: TButton;
    Edit22: TEdit;
    Image2: TImage;
    DBGrid3: TDBGrid;
    DataSource3: TDataSource;
    RxMemoryData2: TRxMemoryData;
    Edit23: TEdit;
    Button35: TButton;
    Button36: TButton;
    Edit24: TEdit;
    Button37: TButton;
    Button38: TButton;
    Button99: TButton;
    Edit16: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button42Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button35Click(Sender: TObject);
    procedure Button36Click(Sender: TObject);
    procedure Button37Click(Sender: TObject);
    procedure Button38Click(Sender: TObject);
    procedure Button99Click(Sender: TObject);
  private
    { Private declarations }
    EDBOGuidesIntf: TFMASAppModule;
    EDBOPersonIntf: TFMASAppModule;
    FB_DB_HANDLE : TISC_DB_HANDLE;
    UseProgressBarFunc: TEDBOCallBackFunction;
    procedure ConfigGrid;
  public
    { Public declarations }
    {$WARNINGS OFF}
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    {$WARNINGS ON}
  end;

var
  TestUnitForm: TTestUnitForm;

implementation

{$R *.dfm}

{ TForm1 }
function Base64Value(c:char; var v:byte) : boolean;
begin
  Result := true;
  case c of
    'A'..'Z' : v := byte(c)-byte('A');
    'a'..'z' : v := byte(c)-byte('a')+26;
    '0'..'9' : v := byte(c)-byte('0')+52;
    '+'      : v := 62;
    '/'      : v := 63;
    else Result := false;
  end;
end;


function Base64Str(s:string; var Data:TMemoryStream):boolean;
var
  a : array[1..4] of char;
  b : array[1..4] of byte;
  d : array[1..4] of byte;
  n4 : integer;
  n8,n6 : byte;
  m,n,k : word;
begin
  Result := false;
  Data.Clear;
  n := length(s);
  if n=0 then Exit;
  if s[n]=#10 then dec(n);
  if s[n]=#13 then dec(n);
  if n>76 then Exit;
  if n=0 then  Exit;
  if (n mod 4)<>0 then Exit;
  n4 := (n-1) div 4;

  for m := 0 to n4  do
  begin
    for k := 1 to 4 do a[k] := s[m*4+k];

    n8 := 3; n6 := 4;

    if m = n4 then
    begin
      if (a[3]='=') and (a[4]='=') then
      begin
        n8:=1; n6:=2;
        a[3]:=#0; a[4]:=#0;
      end else
      if (a[4]='=') then
      begin
        n8 := 2; n6 := 3;
        a[4]:=#0;
      end;
    end;

    FillChar(b[1],4,0);

    for k := 1 to n6 do
    begin
      if not Base64Value(a[k],b[k]) then
      begin
        Data.Clear;
        Exit;
      end;
    end;

    d[1] := byte((b[1] shl 2)) + (b[2] shr 4);
    d[2] := byte((b[2] shl 4)) + (b[3] shr 2) ;
    d[3] := byte((b[3] shl 6)) + b[4];
    for k := 1 to n8 do s := s + char(d[k]);
    Data.Write(d[1],n8);
  end;
  Result := true;
end;



function UseProgressBar(Step:Integer; CountRows:Integer):Integer;
begin
     TestUnitForm.ProgressBar2.Max:=CountRows;
     TestUnitForm.ProgressBar2.Position:=Step;
     TestUnitForm.ProgressBar2.Update;
end;

function UseProgressBar1(Step:Integer; CountRows:Integer):Integer;
begin
     TestUnitForm.ProgressBar1.Max:=CountRows;
     TestUnitForm.ProgressBar1.Position:=Step;
     TestUnitForm.ProgressBar1.Update;
end;


constructor TTestUnitForm.Create(AOwner: TComponent);
var path_str:string;
begin
     inherited Create(AOwner);
     FB_DB_HANDLE:=TResultInfo(accmgmt.fibInitConnection('yaric','kornilova')).DBHandle;

     //Создаем экземпляры классов для работы с веб-сервисами
     //Внимание!!! Если вы предполагаете работу с двумя сервисами EDBOPerson, EDBOGuides
     //то экземпляров должно быть два, один экземпляр на один веб-сервис
     with TFMASAppModuleCreator.Create do
     begin
           path_str:=ExtractFilePath(Application.ExeName) + 'Contingent_Student\';

           //Экземпляр для работы с веб-сервисом EDBOGuides
           EDBOGuidesIntf:= CreateFMASModule(path_str, 'EDBOIntf');
           if (EDBOGuidesIntf=nil)
           then MessageBox(self.Handle, 'Помилка при роботі з модулем взаємодії з ЄДЕБО', 'Увага!', MB_OK or MB_ICONWARNING);


           //Экземпляр для работы с веб-сервисом EDBOPerson
           EDBOPersonIntf:= CreateFMASModule(path_str, 'EDBOIntf');
           if (EDBOPersonIntf=nil)
           then MessageBox(self.Handle, 'Помилка при роботі з модулем взаємодії з ЄДЕБО', 'Увага!', MB_OK or MB_ICONWARNING);


           UseProgressBarFunc:=UseProgressBar;
     end;
end;

destructor TTestUnitForm.Destroy;
begin
     //Освобождаем ресурсы
     if Assigned(EDBOGuidesIntf) then EDBOGuidesIntf.Free;

     if Assigned(EDBOPersonIntf) then EDBOPersonIntf.Free;
end;

procedure TTestUnitForm.Button1Click(Sender: TObject);
begin
     //Соединяемся с веб-сервисом EDBOGuides
     if (EDBOGuidesIntf as IEDBOTools).InitEDBOConnection('EDBOGuides',FB_DB_HANDLE)
     then begin
               Button2.Enabled:=true;
               Button4.Enabled:=true;
               Button5.Enabled:=true;
               Button6.Enabled:=true;
               Button7.Enabled:=true;
               Button11.Enabled:=true;
               Button12.Enabled:=true;
               Button13.Enabled:=true;
               Button14.Enabled:=true;
               Button15.Enabled:=true;
               Button21.Enabled:=true;
               Button23.Enabled:=true;
               Button37.Enabled:=true;
     end;
end;

procedure TTestUnitForm.Button2Click(Sender: TObject);
begin
     (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('CoursesGet',RxMemoryData);

     ConfigGrid;
end;

procedure TTestUnitForm.Button4Click(Sender: TObject);
begin
     (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('UniversitiesGet',RxMemoryData);
     if RxMemoryData.RecordCount>0
     then Edit23.Text:=RxMemoryData.FieldByName('FUniversityKode').AsString;
     ConfigGrid;
end;

procedure TTestUnitForm.Button5Click(Sender: TObject);
var Id_PersonRequestSeasons:Integer;
begin
     ProgressBar1.Position:=0;
     ProgressBar1.Update;

     Id_PersonRequestSeasons:=2;
     EDBOGuidesIntf.InParams.Items['Id_PersonRequestSeasons'] := PInteger(@Id_PersonRequestSeasons);
     (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('UniversityFacultetSpecialitiesGet',RxMemoryData, UseProgressBar1);

     ConfigGrid;
end;

procedure TTestUnitForm.Button6Click(Sender: TObject);
begin
     (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('SpecGet',RxMemoryData);

     ConfigGrid;
end;

procedure TTestUnitForm.Button7Click(Sender: TObject);
begin
     (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('UniversityFacultetsGet',RxMemoryData);

     ConfigGrid;
end;

procedure TTestUnitForm.Button8Click(Sender: TObject);
begin
     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('QualificationsGet',RxMemoryData1);

     ConfigGrid;
end;

procedure TTestUnitForm.Button3Click(Sender: TObject);
begin
     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationFormsGet',RxMemoryData1);

     ConfigGrid;
end;

procedure TTestUnitForm.Button9Click(Sender: TObject);
begin
     if (EDBOPersonIntf as IEDBOTools).InitEDBOConnection('EDBOPerson',FB_DB_HANDLE)
     then begin
               Button8.Enabled:=true;
               Button3.Enabled:=true;
               Button10.Enabled:=true;
               Button16.Enabled:=true;
               Button17.Enabled:=true;
               Button18.Enabled:=true;
               Button19.Enabled:=true;
               Button20.Enabled:=true;
               Button22.Enabled:=true;
               Button25.Enabled:=true;
               Button24.Enabled:=true;
               Button26.Enabled:=true;
               Button27.Enabled:=true;
               Button28.Enabled:=true;
               Button29.Enabled:=true;
               Button99.Enabled:=true;
               Button31.Enabled:=true;
               Button32.Enabled:=true;
               Button33.Enabled:=true;
               Button34.Enabled:=true;
               Button35.Enabled:=true;
               Button36.Enabled:=true;
               Button38.Enabled:=true;
               Button42.Enabled:=true;
     end;
end;

procedure TTestUnitForm.Button10Click(Sender: TObject);
begin
     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonRequestSeasonsGet',RxMemoryData1);

     ConfigGrid;
end;

procedure TTestUnitForm.Button11Click(Sender: TObject);
begin
     (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('StreetTypesGet',RxMemoryData);

     ConfigGrid;
end;

procedure TTestUnitForm.Button12Click(Sender: TObject);
var Hundred:Integer;
    NameMask:AnsiString;
begin

     NameMask:=Edit2.Text;
     EDBOGuidesIntf.InParams.Items['NameMask']:=PAnsiString(@NameMask);

     Hundred:=0;  //Требуется дополнительный параметр - номер сотни записей
     EDBOGuidesIntf.InParams.Items['Hundred'] := PInteger(@Hundred);

     (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('KOATUUGet',RxMemoryData);

     ConfigGrid;
end;

procedure TTestUnitForm.Button13Click(Sender: TObject);
begin
     (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('KOATUUGetL1',RxMemoryData);

     ConfigGrid;
end;

procedure TTestUnitForm.Button14Click(Sender: TObject);
var KOATUUCodeL1:String;
begin
     KOATUUCodeL1:=Edit6.Text;
     EDBOGuidesIntf.InParams.Items['KOATUUCodeL1'] := PString(@KOATUUCodeL1);
     (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('KOATUUGetL2',RxMemoryData);

     ConfigGrid;
end;

procedure TTestUnitForm.Button15Click(Sender: TObject);
var KOATUUCodeL2:String;
begin
     KOATUUCodeL2:=Edit7.Text;
     EDBOGuidesIntf.InParams.Items['KOATUUCodeL2'] := PString(@KOATUUCodeL2);
     (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('KOATUUGetL3',RxMemoryData);


     ConfigGrid;
end;

procedure TTestUnitForm.Button16Click(Sender: TObject);
var FIOMask:AnsiString;
    DocumentSeries:AnsiString;
    DocumentNumber:AnsiString;
    PersonCodeU:AnsiString;
begin
     ProgressBar2.Position:=0;
     ProgressBar2.Update;

     FIOMask:=Edit1.Text;
     EDBOPersonIntf.InParams.Items['FIOMask'] := PAnsiString(@FIOMask);

     DocumentSeries:='';
     EDBOPersonIntf.InParams.Items['DocumentSeries'] := PAnsiString(@DocumentSeries);

     DocumentNumber:='';
     EDBOPersonIntf.InParams.Items['DocumentNumber'] := PAnsiString(@DocumentNumber);

     PersonCodeU:='';
     EDBOPersonIntf.InParams.Items['PersonCodeU'] := PAnsiString(@PersonCodeU);

     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonsFind',RxMemoryData1, UseProgressBar);

     ConfigGrid;

     ProgressBar2.Position:=0;
     ProgressBar2.Update;
end;

procedure TTestUnitForm.ConfigGrid;
var i:Integer;
begin
     for i:=0 to DBGrid2.Columns.Count-1
     do DBGrid2.Columns[i].Width:=150;

     for i:=0 to DBGrid1.Columns.Count-1
     do DBGrid1.Columns[i].Width:=150;
end;

procedure TTestUnitForm.Button17Click(Sender: TObject);
var
    FIOMask:WideString;
    DocumentSeries:AnsiString;
    DocumentNumber:AnsiString;
    PersonCodeU:AnsiString;
begin
     FIOMask:='';
     EDBOPersonIntf.InParams.Items['FIOMask']        := PAnsiString(@FIOMask);

     DocumentSeries:=Edit4.Text;
     EDBOPersonIntf.InParams.Items['DocumentSeries'] := PAnsiString(@DocumentSeries);

     DocumentNumber:=Edit3.Text;
     EDBOPersonIntf.InParams.Items['DocumentNumber'] := PAnsiString(@DocumentNumber);

     PersonCodeU:='';
     EDBOPersonIntf.InParams.Items['PersonCodeU']    := PAnsiString(@PersonCodeU);

     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonsFind',RxMemoryData1);

     ConfigGrid;
end;

procedure TTestUnitForm.Button18Click(Sender: TObject);
var PersonCodeU:AnsiString;
begin
     PersonCodeU:=Edit5.Text;
     EDBOPersonIntf.InParams.Items['PersonCodeU']:=PAnsiString(@PersonCodeU);
     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonAddresses',RxMemoryData1);

     ConfigGrid;
end;

procedure TTestUnitForm.Button19Click(Sender: TObject);
begin
     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('CountriesGet',RxMemoryData1);

     ConfigGrid;
end;

procedure TTestUnitForm.Button20Click(Sender: TObject);
var PersonCodeU:AnsiString;
begin
     PersonCodeU:=Edit8.Text;
     EDBOPersonIntf.InParams.Items['PersonCodeU']:=PAnsiString(@PersonCodeU);
     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonContactsGet',RxMemoryData1);

     ConfigGrid;
end;

procedure TTestUnitForm.Button21Click(Sender: TObject);
begin
     (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('LanguagesGet',RxMemoryData);

     ConfigGrid;
end;

procedure TTestUnitForm.Button22Click(Sender: TObject);
var UniversityKode:AnsiString;
    Id_AcademicYear:Integer;
begin
     UniversityKode:=Edit23.Text;
     Id_AcademicYear:=StrToInt(Edit9.Text); //Идентификатор академического года получить EDBOGuides.AcademicYearsGet

     EDBOPersonIntf.InParams.Items['UniversityKode']:=PAnsiString(@UniversityKode);
     EDBOPersonIntf.InParams.Items['Id_AcademicYear']:=PInteger(@Id_AcademicYear);

     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonsStudentsGrupsGet',RxMemoryData1, UseProgressBar);

     ConfigGrid;
end;

procedure TTestUnitForm.Button23Click(Sender: TObject);
begin
     (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('AcademicYearsGet',RxMemoryData);

     ConfigGrid;
end;

procedure TTestUnitForm.Button25Click(Sender: TObject);
begin
     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonDocumentTypesGet', RxMemoryData1, UseProgressBar);

     ConfigGrid;
end;

procedure TTestUnitForm.Button26Click(Sender: TObject);
var PersonCodeU:AnsiString;
    Id_PersonDocumentType:Integer;
begin
     PersonCodeU:=Edit11.Text;
     EDBOPersonIntf.InParams.Items['PersonCodeU']:=PAnsiString(@PersonCodeU);
     Id_PersonDocumentType:=StrToInt(Edit12.Text);
     EDBOPersonIntf.InParams.Items['Id_PersonDocumentType']:=PInteger(@Id_PersonDocumentType);

     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonDocumentsGet', RxMemoryData1, UseProgressBar);

     ConfigGrid;
end;

procedure TTestUnitForm.Button27Click(Sender: TObject);
begin
     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationHistoryOrdersStatusesGet', RxMemoryData1, UseProgressBar);

     ConfigGrid;
end;

procedure TTestUnitForm.Button28Click(Sender: TObject);
var UniversityKode:AnsiString;
    Id_PersonEducationHistoryType:Integer;
    Id_PersonEducationHistoryOrderStatus:Integer;
    Id_AcademicYear:Integer;
begin
     UniversityKode:=edit23.Text; //получить из EDBOGuides.UniversitiesGet
     EDBOPersonIntf.InParams.Items['UniversityKode']:=PAnsiString(@UniversityKode);

     Id_PersonEducationHistoryType:=StrToInt(Edit14.Text);   //Тип приказа
     EDBOPersonIntf.InParams.Items['Id_PersonEducationHistoryType']:=PInteger(@Id_PersonEducationHistoryType);

     Id_PersonEducationHistoryOrderStatus:=StrToInt(Edit13.Text);  //Статус приказа
     EDBOPersonIntf.InParams.Items['Id_PersonEducationHistoryOrderStatus']:=PInteger(@Id_PersonEducationHistoryOrderStatus);

     Id_AcademicYear:=StrToInt(Edit15.Text); //Академический год
     EDBOPersonIntf.InParams.Items['Id_AcademicYear']:=PInteger(@Id_AcademicYear);

     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationHistoryOrdersGet', RxMemoryData1, UseProgressBar);

     ConfigGrid;
end;

procedure TTestUnitForm.Button29Click(Sender: TObject);
begin
     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationHistoryTypesGet', RxMemoryData1, UseProgressBar);

     ConfigGrid;
end;

procedure TTestUnitForm.Button30Click(Sender: TObject);
var UniversityKode:AnsiString;
    PersonRequestSeasons:Integer;
begin
     UniversityKode:=edit23.Text; //получить из EDBOGuides.UniversitiesGet
     EDBOPersonIntf.InParams.Items['UniversityKode']:=PAnsiString(@UniversityKode);

     //PersonRequestSeasons:=StrToInt(Edit16.Text); //Идентификатор приемной кампании
     EDBOPersonIntf.InParams.Items['PersonRequestSeasons'] := PInteger(@PersonRequestSeasons);

     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonsIdsGet', RxMemoryData1, UseProgressBar);

     ConfigGrid;
end;

procedure TTestUnitForm.Button32Click(Sender: TObject);
var
    FIOMask:WideString;
    DocumentSeries:AnsiString;
    DocumentNumber:AnsiString;
    PersonCodeU:AnsiString;
begin
     FIOMask:='';
     EDBOPersonIntf.InParams.Items['FIOMask']        := PAnsiString(@FIOMask);

     DocumentSeries:='';
     EDBOPersonIntf.InParams.Items['DocumentSeries'] := PAnsiString(@DocumentSeries);

     DocumentNumber:='';
     EDBOPersonIntf.InParams.Items['DocumentNumber'] := PAnsiString(@DocumentNumber);

     PersonCodeU:=Edit17.Text;
     EDBOPersonIntf.InParams.Items['PersonCodeU']    := PAnsiString(@PersonCodeU);

     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonsFind',RxMemoryData1);

     ConfigGrid;
end;

procedure TTestUnitForm.Button31Click(Sender: TObject);
var Id_PersonEducationHistoryOrders:Integer;
begin
     Id_PersonEducationHistoryOrders:=StrToInt(Edit18.Text); //Идентификатор типа приказа
     EDBOPersonIntf.InParams.Items['Id_PersonEducationHistoryOrders'] := PInteger(@Id_PersonEducationHistoryOrders);

     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationHistoryOrdersDataGet', RxMemoryData1, UseProgressBar);

     ConfigGrid;
end;

procedure TTestUnitForm.Button42Click(Sender: TObject);
var   PersonCodeU:AnsiString;
begin
     PersonCodeU:=Edit10.Text;
     EDBOPersonIntf.InParams.Items['PersonCodeU']    := PAnsiString(@PersonCodeU);

     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationsGet',RxMemoryData1);

     ConfigGrid;
end;

procedure TTestUnitForm.Button24Click(Sender: TObject);
var Id_PersonEducationHistoryOrders:Integer;
begin
     Id_PersonEducationHistoryOrders:=StrToInt(Edit19.Text); //Идентификатор типа приказа
     EDBOPersonIntf.InParams.Items['Id_PersonEducationHistoryOrders'] := PInteger(@Id_PersonEducationHistoryOrders);

     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('ChangeFIODataGet', RxMemoryData1, UseProgressBar);

     ConfigGrid;
end;

procedure TTestUnitForm.Button33Click(Sender: TObject);
     var   PersonCodeU:AnsiString;
     Id_PersonEducation:Integer;
begin
     PersonCodeU:=Edit20.Text;
     EDBOPersonIntf.InParams.Items['PersonCodeU']    := PAnsiString(@PersonCodeU);
     Id_PersonEducation:=StrToInt(Edit21.Text);
     EDBOPersonIntf.InParams.Items['Id_PersonEducation']    := PInteger(@Id_PersonEducation);

     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationHistoryGet',RxMemoryData1);

     ConfigGrid;
end;

procedure TTestUnitForm.Button34Click(Sender: TObject);
var UniversityKode:AnsiString;
    PersonCodeU:AnsiString;
    Id_AcademicYear:Integer;
    ms : TMemoryStream;
    rms : TMemoryStream;
    jpg:TJpegImage;
begin
     UniversityKode:=edit23.Text; //получить из EDBOGuides.UniversitiesGet
     PersonCodeU:=Edit22.Text;
     EDBOPersonIntf.InParams.Items['PersonCodeU']:=PAnsiString(@PersonCodeU);
     EDBOPersonIntf.InParams.Items['UniversityKode']:=PAnsiString(@UniversityKode);

     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonPhotoGet', RxMemoryData2);

     if (RxMemoryData2.RecordCount>0)
     then begin
               //Декодируем изображение в понятный нам формат
               ms  :=TMemoryStream.Create;
               rms :=TMemoryStream.Create;

               ms.WriteBuffer(RxMemoryData2.FieldByName('FPersonPhotoBase64String').AsString[1],
                              Length(RxMemoryData2.FieldByName('FPersonPhotoBase64String').AsString)*SizeOf(Char));
               ms.Position:=0;
               DecodeStream(ms,rms);
               rms.Position:=0;

               //Загружаем изображение
               jpg:=TJpegImage.Create;
               jpg.LoadFromStream(rms);
               image2.Picture.Graphic:=jpg;
               image2.Update;

               //Освобождаем ресурсы
               ms.free;
               rms.Free;
               jpg.free;
     end;

     ConfigGrid;
end;

procedure TTestUnitForm.FormCreate(Sender: TObject);
begin
     PageControl1.ActivePageIndex:=0;
end;

procedure TTestUnitForm.Button35Click(Sender: TObject);
begin
     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationPaymentTypesGet',RxMemoryData1);

     ConfigGrid;
end;

procedure TTestUnitForm.Button36Click(Sender: TObject);
var PersonCodeU:AnsiString;
    PRS:Integer;
begin
     PersonCodeU:=Edit24.Text;
     EDBOPersonIntf.InParams.Items['PersonCodeU']:=PAnsiString(@PersonCodeU);

     PRS:=2;
     EDBOPersonIntf.InParams.Items['PRS'] := PInteger(@PRS);
     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonRequestsGet',RxMemoryData1);

     ConfigGrid;
end;

procedure TTestUnitForm.Button37Click(Sender: TObject);
var PRS, Hundred, Id_PersonRequestStatusType1:Integer;
    PCU:AnsiString;
begin
     PRS:=3;      //Идентификатор приемной компании
     EDBOGuidesIntf.InParams.Items['PRS'] := PInteger(@PRS);

     //Id_PersonRequestStatusType1:=7; //Идентификатор типа статуса -типа подтвержденные заявки
     //EDBOGuidesIntf.InParams.Items['Id_PersonRequestStatusType1'] := PInteger(@Id_PersonRequestStatusType1);

     PCU:=Edit16.Text; //Код физлица - параметр не обязательный!!!!!
     EDBOGuidesIntf.InParams.Items['PCU']:=PAnsiString(@PCU);

     (EDBOGuidesIntf as IEDBOTools).GetXMLDataFromService('UniversityFacultetsGetRequests',RxMemoryData);

     ConfigGrid;
end;

procedure TTestUnitForm.Button38Click(Sender: TObject);
var UniversityKode:AnsiString;
    Id_Person:Integer;
begin
     UniversityKode:=Edit23.Text;
     EDBOPersonIntf.InParams.Items['UniversityKode']:=PAnsiString(@UniversityKode);

     Id_Person:=460008;
     EDBOPersonIntf.InParams.Items['Id_Person'] := PInteger(@Id_Person);
     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonsStudentsGrupsPersonsFind',RxMemoryData1);

     ConfigGrid;
end;

procedure TTestUnitForm.Button99Click(Sender: TObject);
var UniversityKode:AnsiString;
    Id_PersonRequestSeasons:Integer;
begin
     UniversityKode:=Edit23.Text;
     Id_PersonRequestSeasons:=3; //Идентификатор академического года получить EDBOGuides.AcademicYearsGet

     EDBOPersonIntf.InParams.Items['UniversityKode']:=PAnsiString(@UniversityKode);
     EDBOPersonIntf.InParams.Items['Id_PersonRequestSeasons']:=PInteger(@Id_PersonRequestSeasons);

     (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationsFullGet',RxMemoryData1);

     ConfigGrid;
end;

end.


