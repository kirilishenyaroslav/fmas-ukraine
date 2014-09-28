unit EDBOEntryIntf;

interface

 uses AppStruClasses, Classes, Messages, Windows, SysUtils, Variants, RxMemDS, IniFiles,
 AccMgmt, Ibase, pFibDatabase, pFibDataSet, EDBOGuidesToFMASService, EDBOPersonToFMASService,
 DB, pFibQuery, SoapHTTPClient, forms, dialogs, xmldom, XMLIntf, msxmldom, XMLDoc, SOAPHTTPTrans;

 const IniFileName='edbo_config.ini';


 type
     TEDBOIntf=class(TFMASAppModule,IEDBOTools)
     private
           ActualDate:TDateTime;
           ServiceName:String;
           Login:WideString;
           Pass:WideString;
           AppKey:WideString;
           URL:String;
           Parsing_result:Boolean;
           FB_DB:TpFibDatabase;
           FB_Tr:TPFibTransaction;
           FB_DS:TpFibDataSet;
           FB_DSU:TpFibQuery;
           FB_DB_HANDLE:TISC_DB_HANDLE;
           ServiceIntf:IInvokable;
           WS_IO : THTTPRIO;
           XMLDocument1:TXMLDocument;
           function GetLanguage:Integer;
           function ParseIniFile:Boolean;
           function LoginEDBO:String;
           function  FB_GetSessionGUID:String;
           procedure FB_SetSessionGuid (Session:String);
           procedure GetSystemConsts;
           procedure GetCources  (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure GetSpec     (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure GetUniv     (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure GetSpecBase (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure GetFaculties(var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure GetQualific (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure GetPEForms  (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure GetPerRSeas (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure GetStreetTyp(var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure GetKOATUU   (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure GetKOATUU1  (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure GetKOATUU2  (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure GetKOATUU3  (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure GetPersAddr (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure GetPersons  (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getCountr   (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getpersonCon(var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getLanguages(var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getGroups   (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getAYears   (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getFhoto    (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getDocTypes (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getPDocs    (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getPHTypes  (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getPHStatus (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getPOrders  (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getPOrderFIO(var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getPDateChng(var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getOrderData(var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getPEducat  (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getPHistory (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getTypeFin  (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getPersReq  (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getUnivReg  (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getStudents (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           procedure getStudList (var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
           function  Date2Str(aDT: TDateTime; WithTime: Boolean = True): String;
           function  StringToWideString(const s: AnsiString; codePage: Word): WideString;
           function  WideStringToString(const ws: WideString; codePage: Word): AnsiString;
           procedure HTTPRIO1AfterExecute(const MethodName: String; SOAPResponse: TStream);
           procedure HTTPRIO1BeforeExecute(const MethodName: String; var SOAPRequest: WideString);

     public
           function InitEDBOConnection(ServiseName:String; DB_HANDLE:TISC_DB_HANDLE):Boolean;
           procedure GetXMLDataFromService(MethodName:string; var Result:TRxMemoryData;  CFunc:TEDBOCallBackFunction=nil; isFirstCalling:Integer=0);
           function GetValueFromService(MethodName:string):Variant;
           {$WARNINGS OFF}
           destructor Destroy; override;
           constructor Create(AOwner: TComponent);override;
           {$WARNINGS ON}
     end;
implementation

uses AssociationList, XSBuiltIns, Controls;

{$WARNINGS OFF}

function TEDBOIntf.Date2Str(aDT: TDateTime; WithTime: Boolean = True): String;
begin
      if WithTime
      then Result:= FormatDateTime('dd.mm.yyyy hh:nn:ss', self.ActualDate)
      else Result:= FormatDateTime('dd.mm.yyyy 00:00:00', self.ActualDate);
end;

function TEDBOIntf.StringToWideString(const s: AnsiString; codePage: Word): WideString;
var
  l: integer;
begin
      if (s = '')
      then Result := ''
      else begin
                l := MultiByteToWideChar(codePage, MB_PRECOMPOSED, PChar(@s[1]), - 1, nil, 0);
                SetLength(Result, l - 1);
                if l > 1 then
                  MultiByteToWideChar(CodePage, MB_PRECOMPOSED, PChar(@s[1]),
                    - 1, PWideChar(@Result[1]), l - 1);
      end;
end;

function TEDBOIntf.WideStringToString(const ws: WideString; codePage: Word): AnsiString;
var l: integer;
begin
      if (ws = '')
      then Result := ''
      else begin
                l := WideCharToMultiByte(codePage,WC_COMPOSITECHECK or WC_DISCARDNS or WC_SEPCHARS or WC_DEFAULTCHAR,
                  @ws[1], - 1, nil, 0, nil, nil);
                SetLength(Result, l - 1);
                if l > 1 then
                  WideCharToMultiByte(codePage,WC_COMPOSITECHECK or WC_DISCARDNS or WC_SEPCHARS or WC_DEFAULTCHAR,
                    @ws[1], - 1, @Result[1], l - 1, nil, nil);
      end;
end;


constructor TEDBOIntf.Create(AOwner: TComponent);
begin
     inherited Create(Aowner);
     Parsing_result:=false;
     self.ActualDate:=Now;
     self.XMLDocument1:=TXMLDocument.Create(nil);
end;

destructor TEDBOIntf.Destroy;
begin
      if Assigned(FB_DS) then FB_DS.Free;
      if Assigned(FB_Tr) then FB_Tr.Free;
      if Assigned(FB_Tr) then FB_Db.Free;
      if Assigned(self.XMLDocument1) then XMLDocument1.Free;
      inherited Destroy;
end;

function TEDBOIntf.FB_GetSessionGUID: String;
var Res:Variant;
begin
      Res:=null;
      if (FB_DB_HANDLE<>nil)
      then begin
                if not Assigned(FB_DB)
                then begin
                          FB_DB:=TpFibDatabase.Create(nil);
                          FB_DB.SQLDialect:=3;
                          FB_DB.Handle:=FB_DB_HANDLE;
                end;

                if not Assigned(FB_Tr)
                then begin
                          FB_Tr:= TPFibTransaction.Create(nil);
                          FB_Tr.DefaultDatabase         :=FB_DB;
                end
                else begin
                          if FB_Tr.InTransaction then FB_Tr.RollbackRetaining
                                                 else FB_Tr.StartTransaction;
                end;

                if not FB_DB.Connected
                then begin
                          FB_DB.DefaultTransaction      :=FB_TR;
                          FB_DB.DefaultUpdateTransaction:=FB_TR;
                end;

                if not Assigned(FB_DS)
                then begin
                          FB_DS:=TpFibDataSet.Create(nil);
                          FB_DS.SelectSQL.Text:='select * from EDBO_SHARED_SESSION';
                          FB_DS.Transaction:=FB_Tr;
                          FB_DS.Open;
                end
                else begin
                          if FB_DS.Active
                          then FB_DS.Close;
                          FB_DS.Open;
                end;

                if (FB_DS.RecordCount>0)
                then begin
                          Res:=FB_DS.FieldByName('SESSION').Value;
                end;

                FB_DS.Close;
                FB_Tr.Commit;
      end;

      Result:=VarToStr(Res);
end;

procedure TEDBOIntf.GetSystemConsts;
begin
     //accmgmt
end;

procedure TEDBOIntf.GetXMLDataFromService(MethodName:string; var Result:TRxMemoryData;  CFunc:TEDBOCallBackFunction=nil; isFirstCalling:Integer=0);
var
  ErP:EDBOPersonToFMASService.ArrayOfDLastError;
  ErG:EDBOGuidesToFMASService.ArrayOfDLastError;
begin

     if not Assigned(Result)
     then begin
               Result:=TRxMemoryData.Create(nil);
     end
     else begin
               if Result.Active then Result.Close;
               Result.FieldDefs.Clear;
               Result.Fields.Clear;
     end;

     try
               if UpperCase(self.ServiceName)=UpperCase('EDBOGuides')
               then begin
                         if UpperCase(MethodName)=UpperCase('CoursesGet')
                         then begin
                                   GetCources(Result, CFunc);
                         end;
                         if UpperCase(MethodName)=UpperCase('UniversitiesGet')
                         then begin
                                   GetUniv(Result, CFunc);
                         end;
                         if UpperCase(MethodName)=UpperCase('UniversityFacultetSpecialitiesGet')
                         then begin
                                   GetSpec(Result, CFunc);
                         end;
                         if UpperCase(MethodName)=UpperCase('SpecGet')
                         then begin
                                   GetSpecBase(Result, CFunc);
                         end;
                         if UpperCase(MethodName)=UpperCase('UniversityFacultetsGet')
                         then begin
                                   GetFaculties(Result, CFunc);
                         end;
                         if UpperCase(MethodName)=UpperCase('StreetTypesGet')
                         then begin
                                   GetStreetTyp(Result, CFunc);
                         end;
                         if UpperCase(MethodName)=UpperCase('KOATUUGet')
                         then begin
                                   GetKOATUU(Result, CFunc);
                         end;
                         if UpperCase(MethodName)=UpperCase('KOATUUGetL1')
                         then begin
                                   GetKOATUU1(Result, CFunc);
                         end;
                         if UpperCase(MethodName)=UpperCase('KOATUUGetL2')
                         then begin
                                   GetKOATUU2(Result, CFunc);
                         end;
                         if UpperCase(MethodName)=UpperCase('KOATUUGetL3')
                         then begin
                                   GetKOATUU3(Result, CFunc);
                         end;

                         if UpperCase(MethodName)=UpperCase('LanguagesGet')
                         then begin
                                   getLanguages(Result, CFunc);
                         end;

                         if UpperCase(MethodName)=UpperCase('AcademicYearsGet')
                         then begin
                                   getAYears(Result, CFunc);
                         end;

                         if UpperCase(MethodName)=UpperCase('UniversityFacultetsGetRequests')
                         then begin
                                   getUnivReg(Result, CFunc);
                         end;

               end;

    except on E:Exception do
           begin
                ErG:=(self.ServiceIntf as EDBOGuidesSoap).GetLastError(self.LoginEDBO);
                if ErG<>nil
                then begin
                          if ((ErG[0].LastErrorDescription='') and (isFirstCalling=0))
                          then GetXMLDataFromService(MethodName, Result, CFunc, 1)
                          else ShowMessage(IntToStr(ErG[0].LastErrorCode) +' '+ErG[0].LastErrorDescription);
                end;
           end;
    end;


    try
               if UpperCase(self.ServiceName)=UpperCase('EDBOPerson')
               then begin
                        if UpperCase(MethodName)=UpperCase('PersonsStudentsGrupsPersonsFind')
                        then begin
                                  getStudents(Result, CFunc);
                        end;


                        if UpperCase(MethodName)=UpperCase('PersonRequestsGet')
                        then begin
                                  getPersReq(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonEducationPaymentTypesGet')
                        then begin
                                  getTypeFin(Result, CFunc);
                        end;


                        if UpperCase(MethodName)=UpperCase('QualificationsGet')
                        then begin
                                   GetQualific(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonEducationFormsGet')
                        then begin
                                   GetPEForms(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonRequestSeasonsGet')
                        then begin
                                   GetPerRSeas(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonsFind')
                        then begin
                                   GetPersons(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonAddresses')
                        then begin
                                   GetPersAddr(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('CountriesGet')
                        then begin
                                   getCountr(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonContactsGet')
                        then begin
                                   getpersonCon(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonsStudentsGrupsGet')
                        then begin
                                   getGroups(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonPhotoGet')
                        then begin
                                   getFhoto(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonDocumentTypesGet')
                        then begin
                                   getDocTypes(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonDocumentsGet')
                        then begin
                                   getPDocs(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonEducationHistoryTypesGet')
                        then begin
                                   getPHTypes(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonEducationHistoryOrdersStatusesGet')
                        then begin
                                   getPHStatus(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonEducationHistoryOrdersGet')
                        then begin
                                   getPOrders(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonsIdsGet')
                        then begin
                                   getPDateChng(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonEducationHistoryOrdersDataGet')
                        then begin
                                   getOrderData(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonEducationsGet')
                        then begin
                                   getPEducat(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('ChangeFIODataGet')
                        then begin
                                   getPOrderFIO(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonEducationHistoryGet')
                        then begin
                                   getPHistory(Result, CFunc);
                        end;

                        if UpperCase(MethodName)=UpperCase('PersonEducationsFullGet')
                        then begin
                                   getStudList(Result, CFunc);
                        end;


               end;
    except on E:Exception do
           begin
                ErP:=(self.ServiceIntf as EDBOPersonSoap).GetLastError(self.LoginEDBO);
                if ErP<>nil
                then begin
                          if ((ErP[0].LastErrorDescription='') and (isFirstCalling=0))
                          then GetXMLDataFromService(MethodName, Result, CFunc, 1)
                          else ShowMessage(IntToStr(ErP[0].LastErrorCode) +' '+ErP[0].LastErrorDescription);
                end;
           end;
    end;
end;

procedure TEDBOIntf.HTTPRIO1BeforeExecute(const MethodName: String; var SOAPRequest: WideString);
begin
     //XMLDocument1.LoadFromStream(SOAPRequest);
     //Showmessage(SOAPRequest);
end;

procedure TEDBOIntf.HTTPRIO1AfterExecute(const MethodName: String; SOAPResponse: TStream);
begin
     //XMLDocument1.LoadFromStream(SOAPResponse);
     //Showmessage(XMLDocument1.XML.Text);
end;

function TEDBOIntf.InitEDBOConnection(ServiseName:String; DB_HANDLE:TISC_DB_HANDLE):Boolean;
var Res:Boolean;
    path:string;
begin
     ServiceName   :=ServiseName;
     Res           :=ParseIniFile;
     Parsing_result:=Res;
     FB_DB_HANDLE  :=DB_HANDLE;

     if Parsing_result
     then begin
               WS_IO:=THTTPRIO.Create(nil);
               WS_IO.URL:=self.URL;
               WS_IO.HTTPWebNode.MaxSinglePostSize:=$80000;
               WS_IO.HTTPWebNode.ConnectTimeout:=12000;
               WS_IO.OnAfterExecute:=HTTPRIO1AfterExecute;
               WS_IO.OnBeforeExecute:=HTTPRIO1BeforeExecute;
               WS_IO.HTTPWebNode.UseUTF8InHeader:=true;
               //WS_IO.HTTPWebNode.InvokeOptions:=[soIgnoreInvalidCerts,soAutoCheckAccessPointViaUDDI];

               if (UpperCase(ServiseName)=UpperCase('EDBOGuides'))
               then ServiceIntf:=EDBOGuidesToFMASService.GetEDBOGuidesSoap(false,URL,WS_IO);

               if (UpperCase(ServiseName)=UpperCase('EDBOPerson'))
               then ServiceIntf:=EDBOPersonToFMASService.GetEDBOPersonSoap(false,URL,WS_IO);
     end;

     Result:=Res
             and (FB_DB_HANDLE<>nil)
             and (ServiceIntf<>nil);
end;
{$WARNINGS ON}

function TEDBOIntf.ParseIniFile: Boolean;
var Res:Boolean;
    IniFile:TIniFile;
begin
     if FileExists(ExtractFileDir(ParamStr(0)) + '\'+IniFileName)
     then begin
          IniFile :=TIniFile.Create(ExtractFileDir(ParamStr(0)) + '\'+IniFileName);
          Login   :=StringToWideString(IniFile.ReadString(UpperCase(ServiceName),'Login',Login), CP_ACP);
          Pass    :=StringToWideString(IniFile.ReadString(UpperCase(ServiceName),'Password',Pass), CP_ACP);
          AppKey  :=StringToWideString(IniFile.ReadString(UpperCase(ServiceName),'AppKey',AppKey), CP_ACP);
          URL     :=StringToWideString(IniFile.ReadString(UpperCase(ServiceName),'URL',URL), CP_ACP);

          if (URL<>'')
          then Res:=True
          else Res:=False;
     end
     else Res:=false;

     Result:=Res;
end;

procedure TEDBOIntf.FB_SetSessionGuid (Session:String);
var RCQuery:TpFibDataSet;
begin
      if (FB_DB_HANDLE<>nil)
      then begin
                if not Assigned(FB_DB)
                then begin
                          FB_DB:=TpFibDatabase.Create(nil);
                          FB_DB.SQLDialect:=3;
                          FB_DB.Handle:=FB_DB_HANDLE;
                end;

                if not Assigned(FB_Tr)
                then begin
                          FB_Tr:= TPFibTransaction.Create(nil);
                          FB_Tr.DefaultDatabase         :=FB_DB;
                end
                else begin
                          if FB_Tr.InTransaction then FB_Tr.RollbackRetaining
                                                 else FB_Tr.StartTransaction;
                end;

                if not FB_DB.Connected
                then begin
                          FB_DB.DefaultTransaction      :=FB_TR;
                          FB_DB.DefaultUpdateTransaction:=FB_TR;
                end;

                if not Assigned(FB_DSU)
                then begin
                          FB_DSU:=TpFibQuery.Create(nil);
                          FB_DSU.SQL.Text:='UPDATE EDBO_SHARED_SESSION SET SESSION='+''''+Session+'''';
                          FB_DSU.Transaction:=FB_Tr;
                          FB_DSU.ExecQuery;
                end
                else begin
                          FB_DSU.SQL.Text:='UPDATE EDBO_SHARED_SESSION SET SESSION='+''''+Session+'''';
                          FB_DSU.ExecQuery;
                end;

                FB_DS.Close;
                FB_Tr.Commit;
      end;
end;

function TEDBOIntf.LoginEDBO: string;
var Res:String;
    CheckUser:Integer;
    AL:ArrayOfDLanguages;
begin
     //Получаем сессию из БД
     AL:=nil;
     Res:=FB_GetSessionGUID;
     if (Length(res)=36)
     then begin
               //Проверяем активна ли эта сессия
               if (UpperCase(ServiceName)=UpperCase('EDBOGuides'))
               then begin
                         CheckUser:=0;//(ServiceIntf as EDBOGuidesSoap).CheckUser(Res);
               end
               else begin
                         {try
                             AL:=(ServiceIntf as EDBOPersonSoap).LanguagesGet(Res);
                             CheckUser:=1;
                             except on E:Exception do
                             begin
                                  CheckUser:=0;
                             end;
                         end;}
                         CheckUser:=0;
               end;

               if ((CheckUser=0) or (CheckUser>=99))
               then begin
                         //Сессия не активна необходимо создать новую

                         if (UpperCase(ServiceName)=UpperCase('EDBOGuides'))
                         then begin
                                   Res:=(ServiceIntf as EDBOGuidesSoap).Login(self.Login, self.Pass, 1, self.AppKey);
                         end
                         else begin
                                   Res:=(ServiceIntf as EDBOPersonSoap).Login(self.Login, self.Pass, 1, self.AppKey);
                         end;

                         if length(Res)<>36
                         then begin
                                   //Создаем исключение
                         end;
                         //Записываем идентификатор вновь созданной сессии
                         FB_SetSessionGuid(Res);
               end
               else begin
                         //Сессия активна - возвращаем ее
                         Res:=Res;
               end;
     end
     else begin
               //Бд пуста
               //Логинимся
               if (UpperCase(ServiceName)=UpperCase('EDBOGuides'))
               then begin
                         Res:=(ServiceIntf as EDBOGuidesSoap).Login(self.Login, self.Pass, 1, self.AppKey);
               end
               else begin
                         Res:=(ServiceIntf as EDBOPersonSoap).Login(self.Login, self.Pass, 1, self.AppKey);
               end;

               //Записываем идентификатор вновь созданной сессии
               self.FB_SetSessionGuid(Res);
     end;
     Result:=Res;
end;

function TEDBOIntf.GetValueFromService(MethodName: string): Variant;
var Res:Variant;
begin
     if (UpperCase(ServiceName)=UpperCase('EDBOGuides'))
     then begin
               if UpperCase(MethodName)=UpperCase('CheckUser')
               then begin
                         Res:=(ServiceIntf as EDBOGuidesSoap).CheckUser(LoginEDBO);
               end;

               if UpperCase(MethodName)=UpperCase('Login')
               then begin
                         Res:=(ServiceIntf as EDBOGuidesSoap).Login(self.Login, self.Pass, 1, self.AppKey);
               end;
     end;

     if (UpperCase(ServiceName)=UpperCase('EDBOPerson'))
     then begin
               if UpperCase(MethodName)=UpperCase('CheckUser')
               then begin
                         Res:=0;
               end;
               if UpperCase(MethodName)=UpperCase('Login')
               then begin
                         Res:=(ServiceIntf as EDBOPersonSoap).Login(self.Login, self.Pass, 1, self.AppKey);
               end;
     end;


     Result:=Res;
end;

procedure TEDBOIntf.GetCources(var RS:TRxMemoryData; CFunc: TEDBOCallBackFunction=nil);
var Cources:ArrayOfDCourses;
    i:Integer;
begin
     Cources:=(self.ServiceIntf as EDBOGuidesSoap).CoursesGet(self.LoginEDBO,GetLanguage);
     if (Cources<>nil)
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Course';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FCourseName';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(Cources)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_Course').Value:=Cources[i].Id_Course;
                    RS.FieldByName('FCourseName').Value:=WideStringToString(Cources[i].CourseName, CP_ACP);
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(Cources));
               end
     end;
end;

procedure TEDBOIntf.GetSpec(var RS: TRxMemoryData;
  CFunc: TEDBOCallBackFunction);
var Spec:ArrayOfDUniversityFacultetSpecialities2;
    i:Integer;
    Uni:ArrayOfDUniversities;
begin
     Spec:=nil;

     Uni:=(self.ServiceIntf as EDBOGuidesSoap).UniversitiesGet2(self.LoginEDBO,
                                                               '',
                                                               GetLanguage,
                                                               Date2Str(Now),
                                                               '',
                                                               '',
                                                               '',
                                                               '',
                                                               0);

     if Uni<>nil
     then begin
                          Spec:=(self.ServiceIntf as EDBOGuidesSoap).UniversityFacultetSpecialitiesGet2(self.LoginEDBO, //SessionGUID
                                                                            Uni[0].UniversityKode, //UniversityKode
                                                                            '',   //UniversityFacultetKode
                                                                            '',   //SpecCode
                                                                            self.GetLanguage,    //Id_Language
                                                                            Date2Str(Now), //ActualDate
                                                                            Integer(self.InParams.Items['Id_PersonRequestSeasons']^),    //Id_PersonRequestSeasons
                                                                            0,    //Id_PersonEducationForm
                                                                            '',   //UniversitySpecialitiesKode
                                                                            '',   //SpecDirectionsCode
                                                                            '',   //SpecSpecialityCode
                                                                            '');   //Filters;

                         if (Spec<>nil)
                         then begin

                                   with RS.FieldDefs.AddFieldDef() do
                                   begin
                                       DataType := ftString;
                                       Size:=255;
                                       Name:= 'FSpecSpecialityClasifierCode';
                                       CreateField(RS);
                                   end;

                                   with RS.FieldDefs.AddFieldDef() do
                                   begin
                                       DataType := ftString;
                                       Size:=255;
                                       Name:= 'FSpecClasifierCode';
                                       CreateField(RS);
                                   end;

                                   with RS.FieldDefs.AddFieldDef() do
                                   begin
                                       DataType := ftString;
                                       Size:=255;
                                       Name:= 'FSpecCode';
                                       CreateField(RS);
                                   end;

                                   with RS.FieldDefs.AddFieldDef() do
                                   begin
                                       DataType := ftString;
                                       Size:=255;
                                       Name:= 'FSpecDirectionName';
                                       CreateField(RS);
                                   end;

                                   with RS.FieldDefs.AddFieldDef() do
                                   begin
                                       DataType := ftString;
                                       Size:=255;
                                       Name:= 'FSpecSpecialityName';
                                       CreateField(RS);
                                   end;

                                   
                                   with RS.FieldDefs.AddFieldDef() do
                                   begin
                                       DataType := ftString;
                                       Size:=255;
                                       Name:= 'FUniversityFacultetKode';
                                       CreateField(RS);
                                   end;

                                   with RS.FieldDefs.AddFieldDef() do
                                   begin
                                       DataType := ftInteger;
                                       Name:= 'FId_PersonEducationForm';
                                       CreateField(RS);
                                   end;

                                   with RS.FieldDefs.AddFieldDef() do
                                   begin
                                       DataType := ftInteger;
                                       Name:= 'FId_Qualification';
                                       CreateField(RS);
                                   end;

                                   with RS.FieldDefs.AddFieldDef() do
                                   begin
                                       DataType := ftInteger;
                                       Name:= 'FId_PersonRequestSeasons';
                                       CreateField(RS);
                                   end;



                                   with RS.FieldDefs.AddFieldDef() do
                                   begin
                                       DataType := ftstring;
                                       size:=25;
                                       Name:= 'FDurationEducation';
                                       CreateField(RS);
                                   end;



                                   with RS.FieldDefs.AddFieldDef() do
                                   begin
                                       DataType := ftString;
                                       Size:=255;
                                       Name:= 'FPersonEducationFormName';
                                       CreateField(RS);
                                   end;

                                   with RS.FieldDefs.AddFieldDef() do
                                   begin
                                       DataType := ftString;
                                       Size:=255;
                                       Name:= 'FQualificationName';
                                       CreateField(RS);
                                   end;

                                   with RS.FieldDefs.AddFieldDef() do
                                   begin
                                       DataType := ftString;
                                       Size:=255;
                                       Name:= 'FSpecSpecializationName';
                                       CreateField(RS);
                                   end;

                                   with RS.FieldDefs.AddFieldDef() do
                                   begin
                                       DataType := ftString;
                                       Size:=255;
                                       Name:= 'FNameRequestSeasons';
                                       CreateField(RS);
                                   end;

                                   with RS.FieldDefs.AddFieldDef() do
                                   begin
                                       DataType := ftInteger;
                                       Name:= 'FIsSecondEducation';
                                       CreateField(RS);
                                   end;

                                   RS.Active:=true;
                                   for i:=0 to LENGTH(Spec)-1 do
                                   begin
                                        RS.Insert;
                                        RS.FieldByName('FId_Qualification').Value:=Spec[i].Id_Qualification;
                                        RS.FieldByName('FSpecCode').Value:=Spec[i].SpecCode;
                                        RS.FieldByName('FIsSecondEducation').Value:=Spec[i].IsSecondEducation;
                                        RS.FieldByName('FSpecSpecialityClasifierCode').Value:=Spec[i].SpecSpecialityClasifierCode;
                                        RS.FieldByName('FId_PersonEducationForm').Value:=Spec[i].Id_PersonEducationForm;
                                        RS.FieldByName('FDurationEducation').Value:=Spec[i].DurationEducation.DecimalString;
                                        RS.FieldByName('FId_PersonRequestSeasons').Value:=Spec[i].Id_PersonRequestSeasons;
                                        RS.FieldByName('FNameRequestSeasons').Value:=WideStringToString(Spec[i].NameRequestSeasons, CP_ACP);
                                        RS.FieldByName('FSpecDirectionName').Value:=WideStringToString(Spec[i].SpecDirectionName, CP_ACP);
                                        RS.FieldByName('FPersonEducationFormName').Value:=WideStringToString(Spec[i].PersonEducationFormName, CP_ACP);
                                        RS.FieldByName('FSpecSpecialityName').Value:=WideStringToString(Spec[i].SpecSpecialityName , CP_ACP);
                                        RS.FieldByName('FQualificationName').Value:=WideStringToString(Spec[i].QualificationName , CP_ACP);
                                        RS.FieldByName('FSpecSpecializationName').Value:=WideStringToString(Spec[i].SpecSpecializationName , CP_ACP);
                                        RS.FieldByName('FUniversityFacultetKode').Value:=WideStringToString(Spec[i].UniversityFacultetKode , CP_ACP);
                                        RS.FieldByName('FSpecClasifierCode').Value:=WideStringToString(Spec[i].SpecClasifierCode , CP_ACP);

                                        RS.Post;

                                        if @CFunc<>nil then CFunc(i+1, LENGTH(Spec));
                                   end

                         end;
     end;
end;

procedure TEDBOIntf.GetUniv(var RS: TRxMemoryData;
  CFunc: TEDBOCallBackFunction);
var Uni:ArrayOfDUniversities;
    i:Integer;
begin
     Uni:=(self.ServiceIntf as EDBOGuidesSoap).UniversitiesGet2(self.LoginEDBO,
                                                               '',
                                                               GetLanguage,
                                                               Date2Str(Now),
                                                               '',
                                                               '',
                                                               '',
                                                               '',
                                                               0);
     if (Uni<>nil)
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_University';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FUniversityKode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FUniversityShortName';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(Uni)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_University').Value:=Uni[i].Id_University;
                    RS.FieldByName('FUniversityKode').Value:=WideStringToString(Uni[i].UniversityKode, CP_ACP);
                    RS.FieldByName('FUniversityShortName').Value:=WideStringToString(Uni[i].UniversityShortName, CP_ACP);
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(Uni));
               end
     end;
end;

procedure TEDBOIntf.GetSpecBase(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var Spec:ArrayOfDSpec;
    i:Integer;
begin
      Spec:=(self.ServiceIntf as EDBOGuidesSoap).SpecGet(self.LoginEDBO,//SessionGUID,
                                                         '09.12.2010',  //SpecRedactionCode,
                                                         '',            //SpecIndastryCode,
                                                         '',            //SpecDirectionsCode,
                                                         '',            //SpecSpecialityCode,
                                                         '',            //SpecCode
                                                         GetLanguage,   //Id_Language,
                                                         Date2Str(Now),//ActualDate
                                                         '');//string SpecClasifierCode)

     if (Spec<>nil)
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Spec';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FSpecCode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FSpecSpecializationName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FSpecDirectionName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FSpecSpecialityName';
                   CreateField(RS);
               end;



               RS.Active:=true;
               for i:=0 to LENGTH(Spec)-1 do
               begin
                    RS.Insert;

                    RS.FieldByName('FId_Spec').Value:=Spec[i].Id_Spec;
                    RS.FieldByName('FSpecCode').Value:=Spec[i].SpecCode;
                    RS.FieldByName('FSpecSpecialityName').Value:=WideStringToString(Spec[i].SpecSpecialityName, CP_ACP);
                    RS.FieldByName('FSpecSpecializationName').Value:=WideStringToString(Spec[i].SpecSpecializationName, CP_ACP);
                    RS.FieldByName('FSpecDirectionName').Value:=WideStringToString(Spec[i].SpecDirectionName , CP_ACP);
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(Spec));
               end
     end;


end;

procedure TEDBOIntf.GetFaculties(var RS: TRxMemoryData;CFunc: TEDBOCallBackFunction);
var Facul:ArrayOfDUniversityFacultets;
    Uni:ArrayOfDUniversities;
    i:Integer;
begin
     Facul:=nil;
     Uni:=(self.ServiceIntf as EDBOGuidesSoap).UniversitiesGet2(self.LoginEDBO,
                                                               '',
                                                               1,
                                                               Date2Str(Now),
                                                               '',
                                                               '',
                                                               '',
                                                               '',
                                                               0);

      if (Uni<>nil)
      then begin
                Facul:=(self.ServiceIntf as EDBOGuidesSoap).UniversityFacultetsGet(self.LoginEDBO,
                                                                                  Uni[0].UniversityKode,
                                                                                  '',
                                                                                  GetLanguage,
                                                                                  Date2Str(Now),
                                                                                  0,
                                                                                  '',
                                                                                  -1,
                                                                                  -1,
                                                                                  0,
                                                                                  -1);
               if (Facul<>nil)
               then begin
                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftInteger;
                             Name:= 'FId_UniversityFacultet';
                             CreateField(RS);
                         end;

                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftString;
                             Size:=255;
                             Name:= 'FUniversityFacultetFullName';
                             CreateField(RS);
                         end;

                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftString;
                             Size:=255;
                             Name:= 'FUniversityFacultetKode';
                             CreateField(RS);
                         end;



                         RS.Active:=true;
                         for i:=0 to LENGTH(Facul)-1 do
                         begin
                              RS.Insert;
                              RS.FieldByName('FId_UniversityFacultet').Value:=Facul[i].Id_UniversityFacultet;
                              RS.FieldByName('FUniversityFacultetKode').Value:=WideStringToString(Facul[i].UniversityFacultetKode, CP_ACP);
                              RS.FieldByName('FUniversityFacultetFullName').Value:=WideStringToString(Facul[i].UniversityFacultetFullName , CP_ACP);
                              RS.Post;

                              if @CFunc<>nil then CFunc(i+1, LENGTH(Facul));
                         end
               end;
      end;
end;

procedure TEDBOIntf.GetQualific(var RS: TRxMemoryData;
  CFunc: TEDBOCallBackFunction);
  var Q:ArrayOfDQualification;
      i:Integer;
begin
     Q:= (self.ServiceIntf as EDBOPersonSoap).QualificationsGet(self.LoginEDBO,
                                                                GetLanguage,
                                                                Date2Str(Now));
     if (Q<>nil)
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Qualification';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FQualificationName';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(Q)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_Qualification').Value:=Q[i].Id_Qualification;
                    RS.FieldByName('FQualificationName').Value:=WideStringToString(Q[i].QualificationName, CP_ACP);
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(Q));
               end
     end;
end;

procedure TEDBOIntf.GetPEForms(var RS: TRxMemoryData;
  CFunc: TEDBOCallBackFunction);
var PEF:ArrayOfDPersonEducationFormsGet;
    i:Integer;
begin
     PEF:=(self.ServiceIntf as EDBOPersonSoap).PersonEducationFormsGet(self.LoginEDBO,
                                                                       Date2Str(Now),
                                                                       GetLanguage);
     if (PEF<>nil)
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationForm';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonEducationFormName';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(PEF)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_PersonEducationForm').Value:=PEF[i].Id_PersonEducationForm;
                    RS.FieldByName('FPersonEducationFormName').Value:=WideStringToString(PEF[i].PersonEducationFormName, CP_ACP);
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(PEF));
               end
     end;
end;

procedure TEDBOIntf.GetPerRSeas(var RS: TRxMemoryData;
  CFunc: TEDBOCallBackFunction);
  var P:ArrayOfDPersonRequestSeasons;
      i:Integer;
begin
     P:=(self.ServiceIntf as EDBOPersonSoap).PersonRequestSeasonsGet(self.LoginEDBO,
                                                                     GetLanguage,
                                                                     '',//Date2Str(Now),
                                                                     0,
                                                                     0,
                                                                     -1);

     if P<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonRequestSeasons';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FName';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(P)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_PersonRequestSeasons').Value:=P[i].Id_PersonRequestSeasons;
                    RS.FieldByName('FName').Value:=WideStringToString(P[i].Name, CP_ACP);
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(P));
               end
     end;
end;

procedure TEDBOIntf.GetStreetTyp(var RS: TRxMemoryData;
  CFunc: TEDBOCallBackFunction);
var ST:ArrayOfDStreetTypes;
    i:Integer;
begin
     ST:=(self.ServiceIntf as EDBOGuidesSoap).StreetTypesGet(self.LoginEDBO,GetLanguage);

     if ST<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_StreetType';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_StreetTypeName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FStreetTypeFullName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FStreetTypeShortName';
                   CreateField(RS);
               end;



               RS.Active:=true;
               for i:=0 to LENGTH(ST)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_StreetType').Value:=ST[i].Id_StreetType;
                    RS.FieldByName('FId_StreetTypeName').Value:=st[i].Id_StreetTypeName;
                    RS.FieldByName('FStreetTypeFullName').Value:=WideStringToString(ST[i].StreetTypeFullName, CP_ACP);
                    RS.FieldByName('FStreetTypeShortName').Value:=WideStringToString(ST[i].StreetTypeShortName, CP_ACP);
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(ST));
               end
     end;
end;

procedure TEDBOIntf.GetKOATUU(var RS: TRxMemoryData;
  CFunc: TEDBOCallBackFunction);
var KA:ArrayOfDKOATUU;
    NameMask:WideString;
    i:Integer;
    Hundred:Integer;
begin
     if self.InParams.Items['NameMask']<>nil
     then NameMask       :=StringToWideString(PAnsiString(self.InParams.Items['NameMask'])^, cp_acp)
     else NameMask       :='';

     if self.InParams.Items['Hundred']<>nil
     then Hundred:=Integer(self.InParams.Items['Hundred']^)
     else Hundred:=0;


     KA:=(self.ServiceIntf as EDBOGuidesSoap).KOATUUGet(self.LoginEDBO, //SessionGUID
                   Date2Str(Now),  //ActualDate
                   GetLanguage,    //Id_Language
                   '',             //KOATUUCode
                   Hundred,        //Hundred
                   NameMask,       //NameMask
                   '',             //FullNameMask
                   0);             //WitchRegions


     if KA<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_KOATUU';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCodeL1';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCodeL2';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCodeL3';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FType';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUFullName';
                   CreateField(RS);
               end;



               RS.Active:=true;
               for i:=0 to LENGTH(KA)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_KOATUU').Value:=KA[i].Id_KOATUU;
                    RS.FieldByName('FKOATUUCode').Value:=KA[i].KOATUUCode;
                    RS.FieldByName('FKOATUUCodeL1').Value:=KA[i].KOATUUCodeL1;
                    RS.FieldByName('FKOATUUCodeL2').Value:=KA[i].KOATUUCodeL2;
                    RS.FieldByName('FKOATUUCodeL3').Value:=KA[i].KOATUUCodeL3;
                    RS.FieldByName('FType').Value:=WideStringToString(KA[i].Type_, CP_ACP);
                    RS.FieldByName('FKOATUUName').Value:=WideStringToString(KA[i].KOATUUName, CP_ACP);
                    RS.FieldByName('FKOATUUFullName').Value:=WideStringToString(KA[i].KOATUUFullName, CP_ACP);

                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(KA));
               end
     end;
end;


procedure TEDBOIntf.GetKOATUU1(var RS: TRxMemoryData;
  CFunc: TEDBOCallBackFunction);
var KA:ArrayOfDKOATUU;
    i:Integer;
begin
     KA:=(self.ServiceIntf as EDBOGuidesSoap).KOATUUGetL1(self.LoginEDBO, //SessionGUID
                      Date2Str(Now),  //ActualDate
                      GetLanguage);   //Id_Language)

     if KA<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_KOATUU';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCodeL1';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCodeL2';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCodeL3';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FType';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUFullName';
                   CreateField(RS);
               end;



               RS.Active:=true;
               for i:=0 to LENGTH(KA)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_KOATUU').Value:=KA[i].Id_KOATUU;
                    RS.FieldByName('FKOATUUCode').Value:=KA[i].KOATUUCode;
                    RS.FieldByName('FKOATUUCodeL1').Value:=KA[i].KOATUUCodeL1;
                    RS.FieldByName('FKOATUUCodeL2').Value:=KA[i].KOATUUCodeL2;
                    RS.FieldByName('FKOATUUCodeL3').Value:=KA[i].KOATUUCodeL3;
                    RS.FieldByName('FType').Value:=WideStringToString(KA[i].Type_, CP_ACP);
                    RS.FieldByName('FKOATUUName').Value:=WideStringToString(KA[i].KOATUUName, CP_ACP);
                    RS.FieldByName('FKOATUUFullName').Value:=WideStringToString(KA[i].KOATUUFullName, CP_ACP);

                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(KA));
               end
     end;
end;

procedure TEDBOIntf.GetKOATUU2(var RS: TRxMemoryData;
  CFunc: TEDBOCallBackFunction);
var KA:ArrayOfDKOATUU;
    i:Integer;
begin
     KA:=(self.ServiceIntf as EDBOGuidesSoap).KOATUUGetL2(self.LoginEDBO, //SessionGUID
                      Date2Str(Now),  //ActualDate
                      GetLanguage,
                      PString(self.InParams.Items['KOATUUCodeL1'])^);

     if KA<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_KOATUU';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCodeL1';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCodeL2';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCodeL3';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FType';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUFullName';
                   CreateField(RS);
               end;



               RS.Active:=true;
               for i:=0 to LENGTH(KA)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_KOATUU').Value:=KA[i].Id_KOATUU;
                    RS.FieldByName('FKOATUUCode').Value:=KA[i].KOATUUCode;
                    RS.FieldByName('FKOATUUCodeL1').Value:=KA[i].KOATUUCodeL1;
                    RS.FieldByName('FKOATUUCodeL2').Value:=KA[i].KOATUUCodeL2;
                    RS.FieldByName('FKOATUUCodeL3').Value:=KA[i].KOATUUCodeL3;
                    RS.FieldByName('FType').Value:=WideStringToString(KA[i].Type_, CP_ACP);
                    RS.FieldByName('FKOATUUName').Value:=WideStringToString(KA[i].KOATUUName, CP_ACP);
                    RS.FieldByName('FKOATUUFullName').Value:=WideStringToString(KA[i].KOATUUFullName, CP_ACP);

                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(KA));
               end
     end;
end;

procedure TEDBOIntf.GetKOATUU3(var RS: TRxMemoryData;
  CFunc: TEDBOCallBackFunction);
var KA:ArrayOfDKOATUU;
    i:Integer;
begin
     KA:=(self.ServiceIntf as EDBOGuidesSoap).KOATUUGetL3(self.LoginEDBO, //SessionGUID
                      Date2Str(Now),  //ActualDate
                      GetLanguage,
                      PString(self.InParams.Items['KOATUUCodeL2'])^,'');

     if KA<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_KOATUU';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCodeL1';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCodeL2';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCodeL3';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FType';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUFullName';
                   CreateField(RS);
               end;



               RS.Active:=true;
               for i:=0 to LENGTH(KA)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_KOATUU').Value:=KA[i].Id_KOATUU;
                    RS.FieldByName('FKOATUUCode').Value:=KA[i].KOATUUCode;
                    RS.FieldByName('FKOATUUCodeL1').Value:=KA[i].KOATUUCodeL1;
                    RS.FieldByName('FKOATUUCodeL2').Value:=KA[i].KOATUUCodeL2;
                    RS.FieldByName('FKOATUUCodeL3').Value:=KA[i].KOATUUCodeL3;
                    RS.FieldByName('FType').Value:=WideStringToString(KA[i].Type_, CP_ACP);
                    RS.FieldByName('FKOATUUName').Value:=WideStringToString(KA[i].KOATUUName, CP_ACP);
                    RS.FieldByName('FKOATUUFullName').Value:=WideStringToString(KA[i].KOATUUFullName, CP_ACP);

                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(KA));
               end
     end;
end;

procedure TEDBOIntf.GetPersAddr(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var KA:ArrayOfDPersonAddresses2;
    i:Integer;
    PersonCodeU:WideString;
begin
     if self.InParams.Items['PersonCodeU']<>nil
     then PersonCodeU:=StringToWideString(PString(self.InParams.Items['PersonCodeU'])^, cp_acp)
     else PersonCodeU:='';

     KA:=(self.ServiceIntf as EDBOPersonSoap).PersonAddressesGet2(self.LoginEDBO,
                                                              Date2Str(Now),
                                                              GetLanguage,
                                                              PersonCodeU,
                                                              0);
     if KA<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonAddress';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Country';
                   CreateField(RS);
               end;


               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FKOATUUCode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_StreetType';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FAdress';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FCountryName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FHomeNumber';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FNoResidentAdress';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPostIndex';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FType';
                   CreateField(RS);
               end;



               RS.Active:=true;
               for i:=0 to LENGTH(KA)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_PersonAddress').Value:=KA[i].Id_PersonAddress;
                    RS.FieldByName('FId_Country').Value:=KA[i].Id_Country;
                    RS.FieldByName('FKOATUUCode').Value:=KA[i].KOATUUCode;
                    RS.FieldByName('FId_StreetType').Value:=KA[i].Id_StreetType;
                    RS.FieldByName('FAdress').Value:=WideStringToString(KA[i].Adress, CP_ACP);
                    RS.FieldByName('FCountryName').Value:=WideStringToString(KA[i].CountryName, CP_ACP);
                    RS.FieldByName('FHomeNumber').Value:=WideStringToString(KA[i].HomeNumber, CP_ACP);
                    RS.FieldByName('FNoResidentAdress').Value:=WideStringToString(KA[i].NoResidentAdress, CP_ACP);
                    RS.FieldByName('FPostIndex').Value:=WideStringToString(KA[i].PostIndex, CP_ACP);
                    RS.FieldByName('FType').Value:=WideStringToString(KA[i].Type_, CP_ACP);
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(KA));
               end
     end;

end;

procedure TEDBOIntf.GetPersons(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var P:ArrayOfDPersonsFind2;
    i:Integer;
    fio_mask_w:WideString;
    pass_num_mask_w:WideString;
    pass_seria_mask_w:WideString;
    PersonCodeU:WideString;
begin
     if self.InParams.Items['FIOMask']<>nil
     then fio_mask_w       :=StringToWideString(PAnsiString(self.InParams.Items['FIOMask'])^, cp_acp)
     else fio_mask_w       :='';

     if self.InParams.Items['DocumentNumber']<>nil
     then pass_num_mask_w  :=StringToWideString(PAnsiString(self.InParams.Items['DocumentNumber'])^, cp_acp)
     else pass_num_mask_w  :='';

     if self.InParams.Items['DocumentSeries']<>nil
     then pass_seria_mask_w:=StringToWideString(PAnsiString(self.InParams.Items['DocumentSeries'])^, cp_acp)
     else pass_seria_mask_w:='';

     if self.InParams.Items['PersonCodeU']<>nil
     then PersonCodeU:=StringToWideString(PAnsiString(self.InParams.Items['PersonCodeU'])^, cp_acp)
     else PersonCodeU:='';

     P:=(self.ServiceIntf as EDBOPersonSoap).PersonsFind2(self.LoginEDBO, //SessionGUID
                                                         Date2Str(Now),  //ActualDate
                                                         GetLanguage,    //Id_Language
                                                         fio_mask_w,     //FIOMask
                                                         pass_seria_mask_w,//DocumentSeries
                                                         pass_num_mask_w,//DocumentNumber
                                                         '',             //Ids_DocumentTypes
                                                         0,              //Hundred
                                                         PersonCodeU,    //PersonCodeU
                                                         '');            //Filters
     if P<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=100;
                   Name:= 'FLastName';
                   CreateField(RS);
                   Width:=100;
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=100;
                   Name:= 'FFirstName';
                   CreateField(RS);
                   Width:=100;
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=100;
                   Name:= 'FMiddleName';
                   CreateField(RS);
                   Width:=100;
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Person';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonTypeDict';
                   CreateField(RS);
               end;



               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FResident';
                   CreateField(RS);
               end;


               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonSex';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonDocumentPasp';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=50;
                   Name:= 'FPersonCodeU';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FBirthday';
                   CreateField(RS);
               end;



               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPasportSeries';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPasportNumber';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FPasportDate';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPasportIssued';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonSexName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonTypeName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FBirthplace';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FFIO';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(P)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_Person').Value:=P[i].Id_Person;
                    RS.FieldByName('FId_PersonSex').Value:=P[i].Id_PersonSex;
                    RS.FieldByName('FId_PersonTypeDict').Value:=P[i].Id_PersonSex;

                    RS.FieldByName('FPersonCodeU').Value:=WideStringToString(P[i].PersonCodeU, CP_ACP);

                    RS.FieldByName('FResident').Value:=P[i].Resident;
                    RS.FieldByName('FId_PersonDocumentPasp').Value:=P[i].Id_PersonDocumentPasp;
                    RS.FieldByName('FBirthday').Value:=P[i].Birthday.AsDateTime;
                    RS.FieldByName('FPersonTypeName').Value:=WideStringToString(P[i].PersonTypeName, CP_ACP);
                    RS.FieldByName('FLastName').Value:=WideStringToString(P[i].LastName, CP_ACP);
                    RS.FieldByName('FFirstName').Value:=WideStringToString(P[i].FirstName, CP_ACP);
                    RS.FieldByName('FMiddleName').Value:=WideStringToString(P[i].MiddleName, CP_ACP);

                    RS.FieldByName('FPasportSeries').Value:=WideStringToString(P[i].PasportSeries, CP_ACP);
                    RS.FieldByName('FPasportNumber').Value:=WideStringToString(P[i].PasportNumber, CP_ACP);
                    RS.FieldByName('FPasportIssued').Value:=WideStringToString(P[i].PasportIssued, CP_ACP);
                    RS.FieldByName('FPasportDate').Value:=P[i].PasportDate.AsDateTime;

                    RS.FieldByName('FPersonSexName').Value:=WideStringToString(P[i].PersonSexName, CP_ACP);
                    RS.FieldByName('FBirthplace').Value:=WideStringToString(P[i].Birthplace, CP_ACP);
                    RS.FieldByName('FFIO').Value:=WideStringToString(P[i].FIO, CP_ACP);

                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(P));
               end;
     end;
end;

procedure TEDBOIntf.getCountr(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var ka:ArrayOfDCountries;
    i:Integer;
begin
      ka:=(self.ServiceIntf as EDBOPersonSoap).CountriesGet(self.LoginEDBO, //SessionGUID
                      GetLanguage,
                      Date2Str(Now));  //ActualDate

     if KA<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Country';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FCountryName';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(KA)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_Country').Value:=KA[i].Id_Country;
                    RS.FieldByName('FCountryName').Value:=KA[i].CountryName;
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(KA));
               end
     end;
end;

procedure TEDBOIntf.getpersonCon(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
     var ka:ArrayOfDPersonContacts;
    i:Integer;
    PersonCodeU:WideString;
begin
     if self.InParams.Items['PersonCodeU']<>nil
     then PersonCodeU:=StringToWideString(PString(self.InParams.Items['PersonCodeU'])^, cp_acp)
     else PersonCodeU:='';

     ka:=(self.ServiceIntf as EDBOPersonSoap).PersonContactsGet(self.LoginEDBO, //SessionGUID
                      Date2Str(Now), //ActualDate
                      GetLanguage,
                      PersonCodeU,
                      0);

     if KA<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonContact';
                   CreateField(RS);
               end;


               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FDefaull';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonContactType';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonContactTypeName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FValue';
                   CreateField(RS);
               end;



               RS.Active:=true;
               for i:=0 to LENGTH(KA)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FDefaull').Value:=KA[i].Defaull;
                    RS.FieldByName('FId_PersonContact').Value:=KA[i].Id_PersonContact;
                    RS.FieldByName('FId_PersonContactType').Value:=KA[i].Id_PersonContactType;
                    RS.FieldByName('FPersonContactTypeName').Value:=KA[i].PersonContactTypeName;
                    RS.FieldByName('FValue').Value:=KA[i].Value;
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(KA));
               end
     end;
end;

function TEDBOIntf.GetLanguage: Integer;
begin
     if self.InParams.Items['Id_language']<>nil
     then Result:=PInteger(self.InParams.Items['Id_language'])^
     else Result:=1;
end;

procedure TEDBOIntf.getLanguages(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var L:EDBOGuidesToFMASService.ArrayOfDLanguages;
    i:Integer;
begin
     L:=(self.ServiceIntf as EDBOGuidesSoap).LanguagesGet(self.LoginEDBO);

     if L<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Language';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FLanguageName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FCode';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(L)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_Language').Value:=L[i].Id_Language;
                    RS.FieldByName('FLanguageName').Value:=L[i].NameLanguage;
                    RS.FieldByName('FCode').Value:=L[i].Code;
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(L));
               end
     end;
end;

procedure TEDBOIntf.getGroups(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var G:ArrayOfDPersonsStudentsGrups2;
    UniversityKode:WideString;
    Id_AcademicYear:Integer;
    i:Integer;
begin
    if self.InParams.Items['UniversityKode']<>nil
    then UniversityKode:=StringToWideString(PString(self.InParams.Items['UniversityKode'])^, cp_acp)
    else UniversityKode:='';

    if self.InParams.Items['Id_AcademicYear']<>nil
    then Id_AcademicYear:=PInteger(self.InParams.Items['Id_AcademicYear'])^
    else Id_AcademicYear:=-1;

    G:=(self.ServiceIntf as EDBOPersonSoap).
       PersonsStudentsGrupsGet2(self.LoginEDBO,
                               Date2Str(Now),
                               GetLanguage,
                               1,
                               UniversityKode,
                               Id_AcademicYear,
                               '');

    if (G<>nil)
    then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_UniversityGroup';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationForm';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Qualification';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Course';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FStudentsCount';
                   CreateField(RS);
               end;


               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FUniversityFacultetKode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FUniversityGroupFullName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FUniversityGroupShortName';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(G)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_UniversityGroup').Value       :=G[i].Id_UniversityGroup;
                    RS.FieldByName('FId_PersonEducationForm').Value   :=G[i].Id_PersonEducationForm;
                    RS.FieldByName('FId_Qualification').Value         :=G[i].Id_Qualification;
                    RS.FieldByName('FId_Course').Value                :=G[i].Id_Course;
                    RS.FieldByName('FStudentsCount').Value            :=G[i].StudentsCount;
                    RS.FieldByName('FUniversityFacultetKode').Value   :=WideStringToString(G[i].UniversityFacultetKode, CP_ACP);
                    RS.FieldByName('FUniversityGroupFullName').Value  :=WideStringToString(G[i].UniversityGroupFullName, CP_ACP);
                    RS.FieldByName('FUniversityGroupShortName').Value :=WideStringToString(G[i].UniversityGroupShortName, CP_ACP);
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(G));
               end
    end;
end;

procedure TEDBOIntf.getAYears(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var Y:ArrayOfDAcademicYears;
    i:Integer;
begin
     Y:=(self.ServiceIntf as EDBOGuidesSoap).AcademicYearsGet(self.LoginEDBO,
                                                              GetLanguage);
     if (Y<>nil)
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_AcademicYear';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FAcademicYearName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FAcademicYearIsActive';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(Y)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_AcademicYear').Value:=Y[i].Id_AcademicYear;
                    RS.FieldByName('FAcademicYearName').Value:=Y[i].AcademicYearName;
                    RS.FieldByName('FAcademicYearIsActive').Value:=Y[i].AcademicYearIsActive;
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(Y));
               end
     end;
end;

procedure TEDBOIntf.getFhoto(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var P:ArrayOfDPersonSOAPPhoto;
    UniversityKode:WideString;
    PersonCodeU:WideString;
    i:Integer;
begin
    if self.InParams.Items['UniversityKode']<>nil
    then UniversityKode:=StringToWideString(PString(self.InParams.Items['UniversityKode'])^, cp_acp)
    else UniversityKode:='';

    if self.InParams.Items['PersonCodeU']<>nil
    then PersonCodeU:=StringToWideString(PString(self.InParams.Items['PersonCodeU'])^, cp_acp)
    else PersonCodeU:='';

    P:=(self.ServiceIntf as EDBOPersonSoap).PersonSOAPPhotoGet(self.LoginEDBO,
                                                            UniversityKode,
                                                            PersonCodeU);
    if P<>nil
    then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonPhoto';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FPersonPhotoIsActive';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FPersonPhotoDateLastChange';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   size:=8000;
                   Name:= 'FPersonPhotoBase64String';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(P)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_PersonPhoto').Value           :=P[i].Id_PersonPhoto;
                    RS.FieldByName('FPersonPhotoIsActive').Value      :=P[i].PersonPhotoIsActive;
                    RS.FieldByName('FPersonPhotoDateLastChange').Value:=P[i].PersonPhotoDateLastChange.AsDateTime;
                    RS.FieldByName('FPersonPhotoBase64String').Value  :=P[i].PersonPhotoBase64String;
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(P));
               end
    end;



end;

procedure TEDBOIntf.getDocTypes(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var DT:ArrayOfDPersonDocumentTypes;
    i:Integer;
begin
     DT:=(self.ServiceIntf as EDBOPersonSoap).
     PersonDocumentTypesGet(self.LoginEDBO,
                            Date2Str(Now),
                            GetLanguage);

    if DT<>nil
    then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonDocumentType';
                   CreateField(RS);
               end;


               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonDocumentTypeName';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(DT)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_PersonDocumentType').Value    :=DT[i].Id_PersonDocumentType;
                    RS.FieldByName('FPersonDocumentTypeName').Value   :=WideStringToString(DT[i].PersonDocumentTypeName, CP_ACP);
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(DT));
               end
    end;
end;

procedure TEDBOIntf.getPDocs(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var PD:ArrayOfDPersonDocuments2;
    PersonCodeU:WideString;
    Id_PersonDocumentType:Integer;
    I:Integer;
begin
     if self.InParams.Items['PersonCodeU']<>nil
     then PersonCodeU:=StringToWideString(PString(self.InParams.Items['PersonCodeU'])^, cp_acp)
     else PersonCodeU:='';

     if self.InParams.Items['Id_PersonDocumentType']<>nil
     then Id_PersonDocumentType:=PInteger(self.InParams.Items['Id_PersonDocumentType'])^
     else Id_PersonDocumentType:=0;

     PD:=(self.ServiceIntf as EDBOPersonSoap).
         PersonDocumentsGet2(self.LoginEDBO,
                            Date2Str(Now),
                            GetLanguage,
                            PersonCodeU,
                            Id_PersonDocumentType,
                            0,
                            '',
                            -1);

     if PD<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonDocument';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FCancellad';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FDocumentSeries';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FDocumentNumbers';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FDocumentDateGet';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FDocumentExpiredDate';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FPersonDocumentBegin';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FPersonDocumentEnd';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FDocumentIssued';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(PD)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_PersonDocument').Value    :=PD[i].Id_PersonDocument;
                    RS.FieldByName('FCancellad').Value            :=PD[i].Cancellad;
                    RS.FieldByName('FDocumentSeries').Value       :=WideStringToString(PD[i].DocumentSeries, CP_ACP);
                    RS.FieldByName('FDocumentNumbers').Value      :=WideStringToString(PD[i].DocumentNumbers, CP_ACP);
                    RS.FieldByName('FDocumentIssued').Value       :=WideStringToString(PD[i].DocumentIssued, CP_ACP);
                    RS.FieldByName('FDocumentDateGet').Value      :=PD[i].DocumentDateGet.AsDateTime;
                    RS.FieldByName('FDocumentExpiredDate').Value  :=PD[i].DocumentExpiredDate.AsDateTime;
                    RS.FieldByName('FPersonDocumentBegin').Value  :=PD[i].PersonDocumentBegin.AsDateTime;
                    RS.FieldByName('FPersonDocumentEnd').Value    :=PD[i].PersonDocumentEnd.AsDateTime;

                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(PD));
               end
     end;
end;

procedure TEDBOIntf.getPHTypes(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
   var HT:ArrayOfDPersonEducationHistoryTypes;
        i:Integer;
begin
     HT:=(self.ServiceIntf as EDBOPersonSoap).
         PersonEducationHistoryTypesGet(self.LoginEDBO,
                                        Date2Str(Now),
                                        GetLanguage);

     if (HT<>nil)
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationHistoryType';
                   CreateField(RS);
               end;


               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonEducationHistoryTypeName';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(HT)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_PersonEducationHistoryType').Value    :=HT[i].Id_PersonEducationHistoryType;
                    RS.FieldByName('FPersonEducationHistoryTypeName').Value   :=WideStringToString(HT[i].PersonEducationHistoryTypeName, CP_ACP);
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(HT));
               end;

               RS.Insert;
               RS.FieldByName('FId_PersonEducationHistoryType').Value    :=10;
               RS.FieldByName('FPersonEducationHistoryTypeName').Value   :='На зарахування';
               RS.Post;

               RS.Insert;
               RS.FieldByName('FId_PersonEducationHistoryType').Value    :=70;
               RS.FieldByName('FPersonEducationHistoryTypeName').Value   :='Зміна ПІБ';
               RS.Post;
     end;
end;

procedure TEDBOIntf.getPHStatus(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var S:ArrayOfDPersonEducationHistoryOrdersStatuses;
    i:Integer;
begin
     S:=(self.ServiceIntf as EDBOPersonSoap).PersonEducationHistoryOrdersStatusesGet(self.LoginEDBO);

     if S<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationHistoryOrderStatus';
                   CreateField(RS);
               end;


               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonEducationHistoryOrderStatusName';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(S)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_PersonEducationHistoryOrderStatus').Value    :=S[i].Id_PersonEducationHistoryOrderStatus;
                    RS.FieldByName('FPersonEducationHistoryOrderStatusName').Value   :=WideStringToString(S[i].PersonEducationHistoryOrderStatusName, CP_ACP);
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(S));
               end
     end;
end;

procedure TEDBOIntf.getPOrders(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var O:ArrayOfDPersonEducationHistoryOrders2;
    UniversityKode:WideString;
    i:Integer;
    Id_PersonEducationHistoryType:Integer;
    Id_PersonEducationHistoryOrderStatus:Integer;
    Id_AcademicYear:Integer;
begin
    if self.InParams.Items['UniversityKode']<>nil
    then UniversityKode:=StringToWideString(PString(self.InParams.Items['UniversityKode'])^, cp_acp)
    else UniversityKode:='-1';

    if self.InParams.Items['Id_PersonEducationHistoryType']<>nil
    then Id_PersonEducationHistoryType:=PInteger(self.InParams.Items['Id_PersonEducationHistoryType'])^
    else Id_PersonEducationHistoryType:=0;

    if self.InParams.Items['Id_PersonEducationHistoryOrderStatus']<>nil
    then Id_PersonEducationHistoryOrderStatus:=PInteger(self.InParams.Items['Id_PersonEducationHistoryOrderStatus'])^
    else Id_PersonEducationHistoryOrderStatus:=0;

    if self.InParams.Items['Id_AcademicYear']<>nil
    then Id_AcademicYear:=PInteger(self.InParams.Items['Id_AcademicYear'])^
    else Id_AcademicYear:=0;


    O:=(self.ServiceIntf as EDBOPersonSoap).
         PersonEducationHistoryOrdersGet2(self.LoginEDBO,
                                        Date2Str(Now),
                                        GetLanguage,
                                        UniversityKode,
                                        Id_PersonEducationHistoryType,
                                        Id_PersonEducationHistoryOrderStatus,
                                        '~1#'+IntToStr(Id_AcademicYear));

     if (O<>nil)
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationHistoryOrders';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonEducationHistoryOrdersNumber';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FPersonEducationHistoryOrdersDate';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FIsVerified';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_RegulationDocumentVerificationHistoryType';
                   CreateField(RS);
               end;



               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationHistoryType';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationHistoryOrderStatus';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FStudCount';
                   CreateField(RS);
               end;


               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FRegulationDocumentVerificationHistoryTypeName';
                   CreateField(RS);
               end;




               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonEducationHistoryOrderStatusName';
                   CreateField(RS);
               end;



               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FPersonEducationHistoryOrdersDateLastChange';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonEducationHistoryTypeName';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(O)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_PersonEducationHistoryOrders').Value                 :=O[i].Id_PersonEducationHistoryOrders;
                    RS.FieldByName('FIsVerified').Value                                      :=O[i].IsVerified;
                    RS.FieldByName('FStudCount').Value                                       :=O[i].StudCount;
                    RS.FieldByName('FId_RegulationDocumentVerificationHistoryType').Value    :=O[i].Id_RegulationDocumentVerificationHistoryType;
                    RS.FieldByName('FId_PersonEducationHistoryType').Value                   :=O[i].Id_PersonEducationHistoryType;
                    RS.FieldByName('FId_PersonEducationHistoryOrderStatus').Value            :=O[i].Id_PersonEducationHistoryOrderStatus;
                    RS.FieldByName('FPersonEducationHistoryOrderStatusName').Value           :=WideStringToString(O[i].PersonEducationHistoryOrderStatusName, CP_ACP);
                    RS.FieldByName('FRegulationDocumentVerificationHistoryTypeName').Value   :=WideStringToString(O[i].RegulationDocumentVerificationHistoryTypeName, CP_ACP);
                    RS.FieldByName('FPersonEducationHistoryTypeName').Value                  :=WideStringToString(O[i].PersonEducationHistoryTypeName, CP_ACP);
                    RS.FieldByName('FPersonEducationHistoryOrdersNumber').Value              :=WideStringToString(O[i].PersonEducationHistoryOrdersNumber, CP_ACP);
                    RS.FieldByName('FPersonEducationHistoryOrdersDate').AsDateTime           :=O[i].PersonEducationHistoryOrdersDate.AsDateTime;
                    RS.FieldByName('FPersonEducationHistoryOrdersDateLastChange').AsDateTime :=O[i].PersonEducationHistoryOrdersDateLastChange.AsDateTime;

                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(O));
               end
     end;
end;

procedure TEDBOIntf.getPDateChng(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var R:ArrayOfDPersonsIds;
    i:Integer;
    UniversityKode:WideString;
    PersonRequestSeasons:Integer;
begin
     if self.InParams.Items['UniversityKode']<>nil
     then UniversityKode:=StringToWideString(PString(self.InParams.Items['UniversityKode'])^, cp_acp)
     else UniversityKode:='-1';

     if self.InParams.Items['PersonRequestSeasons']<>nil
     then PersonRequestSeasons:=PInteger(self.InParams.Items['PersonRequestSeasons'])^
     else PersonRequestSeasons:=-1;

     R:=(self.ServiceIntf as EDBOPersonSoap).
         PersonsIdsGet(self.LoginEDBO,
                            GetLanguage,
                            PersonRequestSeasons,
                            UniversityKode);

     if R<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Person';
                   CreateField(RS);
               end;


               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonCodeU';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FDateLastChange';
                   CreateField(RS);
               end;



               RS.Active:=true;
               for i:=0 to LENGTH(R)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_Person').Value         :=R[i].Id_Person;
                    RS.FieldByName('FPersonCodeU').Value       :=WideStringToString(R[i].PersonCodeU, CP_ACP);
                    RS.FieldByName('FDateLastChange').Value    :=R[i].DateLastChange.AsDateTime;
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(R));
               end
     end;
end;

procedure TEDBOIntf.getOrderData(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var R:ArrayOfDPersonEducationHistoryOrdersData2;
    Id_PersonEducationHistoryOrders:Integer;
    i:Integer;
begin
      if self.InParams.Items['Id_PersonEducationHistoryOrders']<>nil
      then Id_PersonEducationHistoryOrders:=PInteger(self.InParams.Items['Id_PersonEducationHistoryOrders'])^
      else Id_PersonEducationHistoryOrders:=-1;

      R:=(self.ServiceIntf as EDBOPersonSoap).
      PersonEducationHistoryOrdersDataGet2(self.LoginEDBO,
                                          Date2Str(Now),
                                          GetLanguage,
                                          Id_PersonEducationHistoryOrders,
                                          '');

     if R<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FFIO';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonEducationHistoryTypeName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationForm';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_UniversityGroup';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Qualification';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationHistoryType';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Course';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_AcademicYear';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Person';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonRequest';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducation';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonCodeU';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FSpecCode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonEducationPaymentTypeName';
                   CreateField(RS);
               end;


               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FUniversityFacultetKode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FAcademicLeaveTypeName';
                   CreateField(RS);
               end;




               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonEducationsCancelEducationTypeName';
                   CreateField(RS);
               end;



               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationHistory';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationPaymentType';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FResident';
                   CreateField(RS);
               end;


               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FPersonEducationHistoryDateBegin';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_AcademicLeaveType';
                   CreateField(RS);
               end;



               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationsCancelEducationType';
                   CreateField(RS);
               end;


               RS.Active:=true;
               for i:=0 to LENGTH(R)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_Person').Value                       :=R[i].Id_Person;
                    RS.FieldByName('FId_UniversityGroup').Value              :=R[i].Id_UniversityGroup;
                    RS.FieldByName('FId_PersonEducationForm').Value          :=R[i].Id_PersonEducationForm;
                    RS.FieldByName('FId_Qualification').Value                :=R[i].Id_Qualification;
                    RS.FieldByName('FId_Course').Value                       :=R[i].Id_Course;
                    RS.FieldByName('FId_AcademicYear').Value                 :=R[i].Id_AcademicYear;
                    RS.FieldByName('FId_Person').Value                       :=R[i].Id_Person;
                    RS.FieldByName('FResident').Value                        :=R[i].Resident;
                    RS.FieldByName('FId_PersonRequest').Value                :=R[i].Id_PersonRequest;
                    RS.FieldByName('FPersonEducationHistoryDateBegin').Value :=R[i].PersonEducationHistoryDateBegin.AsDateTime;
                    RS.FieldByName('FId_PersonEducation').Value              :=R[i].Id_PersonEducation;
                    RS.FieldByName('FId_PersonEducationHistory').Value       :=R[i].Id_PersonEducationHistory;
                    RS.FieldByName('FId_PersonEducationPaymentType').Value   :=R[i].Id_PersonEducationPaymentType;
                    RS.FieldByName('FId_PersonEducationHistoryType').Value   :=R[i].Id_PersonEducationHistoryType;
                    RS.FieldByName('FId_PersonRequest').Value                :=R[i].Id_PersonRequest;
                    RS.FieldByName('FId_AcademicLeaveType').Value            :=R[i].Id_AcademicLeaveType;
                    RS.FieldByName('FId_PersonEducationsCancelEducationType').Value                :=R[i].Id_PersonEducationsCancelEducationType;
                    RS.FieldByName('FPersonEducationsCancelEducationTypeName').Value  :=WideStringToString(R[i].PersonEducationsCancelEducationTypeName, CP_ACP);
                    RS.FieldByName('FPersonEducationHistoryTypeName').Value  :=WideStringToString(R[i].PersonEducationHistoryTypeName, CP_ACP);
                    RS.FieldByName('FPersonEducationPaymentTypeName').Value  :=WideStringToString(R[i].PersonEducationPaymentTypeName, CP_ACP);
                    RS.FieldByName('FPersonCodeU').Value                     :=WideStringToString(R[i].PersonCodeU, CP_ACP);
                    RS.FieldByName('FSpecCode').Value                        :=WideStringToString(R[i].SpecCode, CP_ACP);
                    RS.FieldByName('FUniversityFacultetKode').Value          :=WideStringToString(R[i].UniversityFacultetKode, CP_ACP);
                    RS.FieldByName('FFIO').Value                             :=WideStringToString(R[i].FIO, CP_ACP);
                    RS.FieldByName('FAcademicLeaveTypeName').Value           :=WideStringToString(R[i].AcademicLeaveTypeName, CP_ACP);



                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(R));
               end
     end;
end;

procedure TEDBOIntf.getPEducat(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var R:ArrayOfDPersonEducations2;
    i:Integer;
    PersonCodeU:WideString;
begin
     if self.InParams.Items['PersonCodeU']<>nil
     then PersonCodeU:=StringToWideString(PString(self.InParams.Items['PersonCodeU'])^, cp_acp)
     else PersonCodeU:='';

      R:=(self.ServiceIntf as EDBOPersonSoap).
      PersonEducationsGet2(self.LoginEDBO,
                          Date2Str(Now),
                          GetLanguage,
                          PersonCodeU,
                          0,
                          3,
                          '');

     if R<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FPersonEducationDateBegin';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FPersonEducationDateEnd';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_UniversityGroup';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationForm';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Qualification';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Course';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_AcademicYear';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducation';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonCodeU';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FSpecCode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FUniversityFacultetKode';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(R)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FPersonEducationDateBegin').Value    :=R[i].PersonEducationDateBegin.AsDateTime;
                    RS.FieldByName('FPersonEducationDateEnd').Value      :=R[i].PersonEducationDateEnd.AsDateTime;

                    RS.FieldByName('FId_UniversityGroup').Value    :=R[i].Id_UniversityGroup;
                    RS.FieldByName('FId_PersonEducationForm').Value:=R[i].Id_PersonEducationForm;
                    RS.FieldByName('FId_Qualification').Value      :=R[i].Id_Qualification;
                    RS.FieldByName('FId_Course').Value             :=R[i].Id_Course;
                    RS.FieldByName('FId_AcademicYear').Value       :=R[i].Id_AcademicYear;
                    RS.FieldByName('FId_PersonEducation').Value    :=R[i].Id_PersonEducation;
                    RS.FieldByName('FPersonCodeU').Value           :=WideStringToString(R[i].PersonCodeU, CP_ACP);
                    RS.FieldByName('FSpecCode').Value              :=WideStringToString(R[i].SpecCode, CP_ACP);
                    RS.FieldByName('FUniversityFacultetKode').Value:=WideStringToString(R[i].UniversityFacultetKode, CP_ACP);

                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(R));
               end
     end;
end;

procedure TEDBOIntf.getPOrderFIO(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var R:ArrayOfDPersonEducationHistoryOrdersChangeFIOData;
    i:Integer;
    Id_PersonEducationHistoryOrders:Integer;
begin
    if self.InParams.Items['Id_PersonEducationHistoryOrders']<>nil
    then Id_PersonEducationHistoryOrders:=PInteger(self.InParams.Items['Id_PersonEducationHistoryOrders'])^
    else Id_PersonEducationHistoryOrders:=-1;

    R:=(self.ServiceIntf as EDBOPersonSoap).
    PersonEducationHistoryOrdersChangeFIODataGet(self.LoginEDBO,
                                                 Date2Str(Now),
                                                 GetLanguage,
                                                 Id_PersonEducationHistoryOrders,
                                                 '');
    if (R<>nil)
    then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationHistoryOrders';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FFirstName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FMiddleName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FLastName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FDocumentSeries';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FDocumentNumbers';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FDocumentIssued';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FDocumentDescription';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FCurrentFIO';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonCodeU';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FDocumentDateGet';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FFIODateChange';
                   CreateField(RS);
               end;

               RS.Active:=true;

               for i:=0 to LENGTH(R)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_PersonEducationHistoryOrders').Value    :=R[i].Id_PersonEducationHistoryOrders;
                    RS.FieldByName('FDocumentDateGet').Value                    :=R[i].DocumentDateGet.AsDateTime;
                    RS.FieldByName('FFIODateChange').Value                      :=R[i].FIODateChange.AsDateTime;
                    RS.FieldByName('FFirstName').Value                          :=WideStringToString(R[i].FirstName, CP_ACP);
                    RS.FieldByName('FMiddleName').Value                         :=WideStringToString(R[i].MiddleName, CP_ACP);
                    RS.FieldByName('FLastName').Value                           :=WideStringToString(R[i].LastName, CP_ACP);
                    RS.FieldByName('FDocumentSeries').Value                     :=WideStringToString(R[i].DocumentSeries, CP_ACP);
                    RS.FieldByName('FDocumentNumbers').Value                    :=WideStringToString(R[i].DocumentNumbers, CP_ACP);
                    RS.FieldByName('FDocumentIssued').Value                     :=WideStringToString(R[i].DocumentIssued, CP_ACP);
                    RS.FieldByName('FDocumentDescription').Value                :=WideStringToString(R[i].DocumentDescription, CP_ACP);
                    RS.FieldByName('FCurrentFIO').Value                         :=WideStringToString(R[i].CurrentFIO, CP_ACP);
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(R));
               end

    end;
end;

procedure TEDBOIntf.getPHistory(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var R:ArrayOfDPersonEducationHistory2;
    i:Integer;
    PersonCodeU:WideString;
    Id_PersonEducation:Integer;
begin
     if self.InParams.Items['PersonCodeU']<>nil
     then PersonCodeU:=StringToWideString(PString(self.InParams.Items['PersonCodeU'])^, cp_acp)
     else PersonCodeU:='';

     if self.InParams.Items['Id_PersonEducation']<>nil
     then Id_PersonEducation:=PInteger(self.InParams.Items['Id_PersonEducation'])^
     else Id_PersonEducation:=-1;

     R:=(self.ServiceIntf as EDBOPersonSoap).
        PersonEducationHistoryGet2(self.LoginEDBO,
                                  Date2Str(Now),
                                  GetLanguage,
                                  PersonCodeU,
                                  Id_PersonEducation,
                                  0);

     if (R<>nil)
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FIsActive';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationHistory';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationPaymentType';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_AcademicYear';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_UniversityGroup';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Course';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationForm';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Qualification';
                   CreateField(RS);
               end;


               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationHistoryOrders';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationHistoryCorrected';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FIsCorrected';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_OrderOfEnrollment';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_AcademicLeaveType';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationsCancelEducationType';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonCodeU';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FUniversityFacultetKode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FSpecCode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonEducationHistoryDesciption';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FUserFIO';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FOperatorFIO';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonEducationsCancelEducationTypeName';
                   CreateField(RS);
               end;



               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FAcademicLeaveTypeName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FPersonEducationHistoryDateBegin';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FPersonEducationHistoryDateEnd';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FDateLastChange';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducation';
                   CreateField(RS);
               end;


               RS.Active:=true;
               for i:=0 to LENGTH(R)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_PersonEducationHistory').Value         :=R[i].Id_PersonEducationHistory;
                    RS.FieldByName('FId_PersonEducationPaymentType').Value     :=R[i].Id_PersonEducationPaymentType;
                    RS.FieldByName('FId_UniversityGroup').Value                :=R[i].Id_UniversityGroup;
                    RS.FieldByName('FIsActive').Value                          :=R[i].IsActive;
                    RS.FieldByName('FId_UniversityGroup').Value                :=R[i].Id_UniversityGroup;
                    RS.FieldByName('FId_PersonEducation').Value                :=R[i].Id_PersonEducation;
                    RS.FieldByName('FId_Course').Value                         :=R[i].Id_Course;
                    RS.FieldByName('FId_AcademicLeaveType').Value              :=R[i].Id_AcademicLeaveType;
                    RS.FieldByName('FId_PersonEducationsCancelEducationType').Value              :=R[i].Id_PersonEducationsCancelEducationType;
                    RS.FieldByName('FId_PersonEducationForm').Value            :=R[i].Id_PersonEducationForm;
                    RS.FieldByName('FId_Qualification').Value                  :=R[i].Id_Qualification;
                    RS.FieldByName('FId_PersonEducationHistoryOrders').Value   :=R[i].Id_PersonEducationHistoryOrders;
                    RS.FieldByName('FId_PersonEducationHistoryCorrected').Value:=R[i].Id_PersonEducationHistoryCorrected;
                    RS.FieldByName('FIsCorrected').Value                       :=R[i].IsCorrected;
                    RS.FieldByName('FId_OrderOfEnrollment').Value              :=R[i].Id_OrderOfEnrollment;
                    RS.FieldByName('FPersonCodeU').Value                       :=WideStringToString(R[i].PersonCodeU, CP_ACP);
                    RS.FieldByName('FUniversityFacultetKode').Value            :=WideStringToString(R[i].UniversityFacultetKode, CP_ACP);
                    RS.FieldByName('FSpecCode').Value                          :=WideStringToString(R[i].SpecCode, CP_ACP);
                    RS.FieldByName('FPersonEducationHistoryDesciption').Value  :=WideStringToString(R[i].PersonEducationHistoryDesciption, CP_ACP);
                    RS.FieldByName('FAcademicLeaveTypeName').Value             :=WideStringToString(R[i].AcademicLeaveTypeName, CP_ACP);
                    RS.FieldByName('FUserFIO').Value                           :=WideStringToString(R[i].UserFIO, CP_ACP);
                    RS.FieldByName('FOperatorFIO').Value                       :=WideStringToString(R[i].UserFIO, CP_ACP);
                    RS.FieldByName('FPersonEducationsCancelEducationTypeName').Value :=WideStringToString(R[i].PersonEducationsCancelEducationTypeName, CP_ACP);
                    RS.FieldByName('FPersonEducationHistoryDateBegin').Value    :=R[i].PersonEducationHistoryDateBegin.AsDateTime;
                    RS.FieldByName('FPersonEducationHistoryDateEnd').Value      :=R[i].PersonEducationHistoryDateEnd.AsDateTime;
                    RS.FieldByName('FDateLastChange').Value                     :=R[i].DateLastChange.AsDateTime;
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(R));
               end
     end;
end;

procedure TEDBOIntf.getTypeFin(var RS: TRxMemoryData;
  CFunc: TEDBOCallBackFunction);
  var R:ArrayOfDPersonEducationPaymentTypes;
      i:Integer;
begin



     R:=(self.ServiceIntf as EDBOPersonSoap).
     PersonEducationPaymentTypesGet(self.LoginEDBO,
                                    self.Date2Str(Now),
                                    GetLanguage);

     if R<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationPaymentType';
                   CreateField(RS);
               end;


               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonEducationPaymentTypeName';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(R)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_PersonEducationPaymentType').Value         :=R[i].Id_PersonEducationPaymentType;
                    RS.FieldByName('FPersonEducationPaymentTypeName').Value       :=WideStringToString(R[i].PersonEducationPaymentTypeName, CP_ACP);
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(R));
               end
     end;
end;

procedure TEDBOIntf.getPersReq(var RS: TRxMemoryData;
  CFunc: TEDBOCallBackFunction);
var R:ArrayOfDPersonRequests2;
    i:Integer;
    PersonCodeU:WideString;
    PRS:Integer;
begin
     if self.InParams.Items['PersonCodeU']<>nil
     then PersonCodeU:=StringToWideString(PString(self.InParams.Items['PersonCodeU'])^, cp_acp)
     else PersonCodeU:='';

     if self.InParams.Items['PRS']<>nil
     then PRS:=PInteger(self.InParams.Items['PRS'])^
     else PRS:=2;

     R:=(self.ServiceIntf as EDBOPersonSoap).
     PersonRequestsGet2(self.LoginEDBO,
                                    self.Date2Str(Now),
                                    GetLanguage,
                                    PersonCodeU,
                                    PRS,
                                    0,
                                    '',
                                    0,
                                    0,
                                    '');
     if R<>nil
     then begin
               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FIsContract';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_UniversitySpecialities';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationForm';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Qualification';
                   CreateField(RS);
               end;


               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FUniversityFacultetKode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonEnteranceTypeName';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(R)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FIsContract').Value                        :=R[i].IsContract;
                    RS.FieldByName('FId_UniversitySpecialities').Value         :=R[i].Id_UniversitySpecialities;
                    RS.FieldByName('FId_PersonEducationForm').Value            :=R[i].Id_PersonEducationForm;
                    RS.FieldByName('FId_Qualification').Value                  :=R[i].Id_Qualification;
                    RS.FieldByName('FUniversityFacultetKode').Value            :=WideStringToString(R[i].UniversityFacultetKode, CP_ACP);
                    RS.FieldByName('FPersonEnteranceTypeName').Value           :=WideStringToString(R[i].PersonEnteranceTypeName, CP_ACP);
                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(R));
               end
     end;


end;

procedure TEDBOIntf.getUnivReg(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var R:ArrayOfDUniversityFacultetsRequests2;
    i:Integer;
    Hundred:Integer;
    PRS:Integer;
    Id_PersonRequestStatusType1:Integer;
    Uni:ArrayOfDUniversities;
    PCU:WideString;
begin
     Uni:=(self.ServiceIntf as EDBOGuidesSoap).UniversitiesGet2(self.LoginEDBO,
                                                               '',
                                                               GetLanguage,
                                                               Date2Str(Now),
                                                               '',
                                                               '',
                                                               '',
                                                               '',
                                                               0);
     if (Uni<>nil)
     then begin
               
               if self.InParams.Items['PCU']<>nil
               then PCU:=StringToWideString(PString(self.InParams.Items['PCU'])^, cp_acp)
               else PCU:='';

               if self.InParams.Items['PRS']<>nil
               then PRS:=PInteger(self.InParams.Items['PRS'])^
               else PRS:=2;

               R:=(self.ServiceIntf as EDBOGuidesSoap).
               UniversityFacultetsGetRequests2(self.LoginEDBO,
                                              PRS,
                                              '',
                                              '',
                                              GetLanguage,
                                              self.Date2Str(Now),
                                              PCU,
                                              0,
                                              '',
                                              0,//Id_PersonRequestStatusType1, убираем фильтр по статусу заявок
                                              0,
                                              0,
                                              0,
                                              Uni[0].UniversityKode,
                                              0,
                                              '');

               if R<>nil
               then begin
                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftInteger;
                             Name:= 'FId_PersonRequestStatus';
                             CreateField(RS);
                         end;

                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftInteger;
                             Name:= 'FId_PersonRequestStatusType';
                             CreateField(RS);
                         end;

                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftDateTime;
                             Name:= 'FDateLastChange';
                             CreateField(RS);
                         end;

                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftString;
                             Size:=255;
                             Name:= 'FPersonCodeU';
                             CreateField(RS);
                         end;

                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftInteger;
                             Name:= 'FIsContract';
                             CreateField(RS);
                         end;

                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftInteger;
                             Name:= 'FId_UniversitySpecialities';
                             CreateField(RS);
                         end;

                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftInteger;
                             Name:= 'FId_PersonEducationForm';
                             CreateField(RS);
                         end;

                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftInteger;
                             Name:= 'FId_Qualification';
                             CreateField(RS);
                         end;


                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftString;
                             Size:=255;
                             Name:= 'FUniversityFacultetKode';
                             CreateField(RS);
                         end;

                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftString;
                             Size:=255;
                             Name:= 'FPersonEnteranceTypeName';
                             CreateField(RS);
                         end;



                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftString;
                             Size:=255;
                             Name:= 'FUniversitySpecialitiesKode';
                             CreateField(RS);
                         end;

                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftString;
                             Size:=255;
                             Name:= 'FSpecCode';
                             CreateField(RS);

                         end;

                         with RS.FieldDefs.AddFieldDef() do
                         begin
                             DataType := ftString;
                             Size:=255;
                             Name:= 'FCodeOfBusiness';
                             CreateField(RS);
                         end;



                         RS.Active:=true;
                         for i:=0 to LENGTH(R)-1 do
                         begin
                              RS.Insert;
                              RS.FieldByName('FId_PersonRequestStatus').Value            :=R[i].Id_PersonRequestStatus;
                              RS.FieldByName('FId_PersonRequestStatusType').Value        :=R[i].Id_UniversitySpecialities;
                              RS.FieldByName('FDateLastChange').Value                    :=R[i].DateLastChange.AsDateTime;
                              RS.FieldByName('FPersonCodeU').Value                       :=WideStringToString(R[i].PersonCodeU, CP_ACP);
                              RS.FieldByName('FIsContract').Value                        :=R[i].IsContract;
                              RS.FieldByName('FId_UniversitySpecialities').Value         :=R[i].Id_UniversitySpecialities;
                              RS.FieldByName('FId_PersonEducationForm').Value            :=R[i].Id_PersonEducationForm;
                              RS.FieldByName('FId_Qualification').Value                  :=R[i].Id_Qualification;
                              RS.FieldByName('FUniversityFacultetKode').Value            :=WideStringToString(R[i].UniversityFacultetKode, CP_ACP);
                              RS.FieldByName('FPersonEnteranceTypeName').Value           :=WideStringToString(R[i].PersonEnteranceTypeName, CP_ACP);
                              RS.FieldByName('FSpecCode').Value                          :=WideStringToString(R[i].SpecCode, CP_ACP);
                              RS.FieldByName('FCodeOfBusiness').Value                    :=WideStringToString(R[i].CodeOfBusiness, CP_ACP);
                              RS.FieldByName('FUniversitySpecialitiesKode').Value        :=WideStringToString(R[i].UniversitySpecialitiesKode, CP_ACP);


                              RS.Post;

                              if @CFunc<>nil then CFunc(i+1, LENGTH(R));
                         end

               end;
     end;
end;


procedure TEDBOIntf.getStudents(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var R:ArrayOfDPersonsStudentsGrupsPersonsFind2;
    UniversityKode:WideString;
    Id_Person:Integer;
    i:Integer;
begin
     if (self.InParams.Items['UniversityKode']<>nil)
     then UniversityKode:=StringToWideString(PString(self.InParams.Items['UniversityKode'])^, cp_acp)
     else UniversityKode:='';

     if (self.InParams.Items['Id_Person']<>nil)
     then Id_Person:=PInteger(self.InParams.Items['Id_Person'])^
     else Id_Person:=-1;

     if Id_Person=-1
     then begin
               R:=(self.ServiceIntf as EDBOPersonSoap).
               PersonsStudentsGrupsPersonsFind2(self.LoginEDBO,
                                               self.Date2Str(Now),
                                               GetLanguage,
                                               UniversityKode,
                                               '~1#*');
     end
     else begin
               R:=(self.ServiceIntf as EDBOPersonSoap).
               PersonsStudentsGrupsPersonsFind2(self.LoginEDBO,
                                               self.Date2Str(Now),
                                               GetLanguage,
                                               UniversityKode,
                                               '~2#'+IntToStr(Id_Person));
     end;

     if R<>nil
     then begin

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_education_history';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationForm';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Qualification';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FResident';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FUniversityFacultetKode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FSpecCode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Course';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_UniversityGroup';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(R)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_PersonEducationForm').Value            :=R[i].Id_PersonEducationForm;
                    RS.FieldByName('FId_Qualification').Value                  :=R[i].Id_Qualification;
                    RS.FieldByName('FUniversityFacultetKode').Value            :=WideStringToString(R[i].UniversityFacultetKode, CP_ACP);
                    RS.FieldByName('FSpecCode').Value                          :=WideStringToString(R[i].SpecCode, CP_ACP);
                    RS.FieldByName('FResident').Value                          :=R[i].Resident;
                    RS.FieldByName('FId_UniversityGroup').Value                :=R[i].Id_UniversityGroup;
                    RS.FieldByName('FId_Course').Value                         :=R[i].Id_Course;
                    RS.FieldByName('FId_education_history').Value              :=R[i].Id_PersonEducationHistory;

                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(R));
               end
     end;
end;

procedure TEDBOIntf.getStudList(var RS: TRxMemoryData; CFunc: TEDBOCallBackFunction);
var R:ArrayOfDPersonEducationsFull;
    UniversityKode:WideString;
    Id_PersonRequestSeasons:Integer;
    i:Integer;
begin
     if self.InParams.Items['UniversityKode']<>nil
     then UniversityKode:=StringToWideString(PString(self.InParams.Items['UniversityKode'])^, cp_acp)
     else UniversityKode:='';

     if self.InParams.Items['Id_PersonRequestSeasons']<>nil
     then Id_PersonRequestSeasons:=PInteger(self.InParams.Items['Id_PersonRequestSeasons'])^
     else Id_PersonRequestSeasons:=-1;


     R:=(self.ServiceIntf as EDBOPersonSoap).
     PersonEducationsFullGet(self.LoginEDBO,
                             self.Date2Str(Now),
                             GetLanguage,
                             UniversityKode,
                             Id_PersonRequestSeasons);

     if R<>nil
     then begin

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonCodeU';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_education';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationForm';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Qualification';
                   CreateField(RS);
               end;


               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FUniversityFacultetKode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FSpecCode';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Size:=255;
                   Name:= 'FPersonEducationHistoryOrdersNumber';
                   CreateField(RS);
               end;



               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_Course';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_UniversityGroup';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonRequest';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationHistoryOrders';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FPersonEducationHistoryOrdersDate';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationPaymentType';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FId_PersonEducationHistoryType';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FPersonEducationDateBegin';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftDateTime;
                   Name:= 'FPersonEducationDateEnd';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Name:= 'FUniversityFacultetFullName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Name:= 'FSpecSpecialityName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Name:= 'FQualificationName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Name:= 'FUniversityGroupFullName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftString;
                   Name:= 'FPersonEducationFormName';
                   CreateField(RS);
               end;

               with RS.FieldDefs.AddFieldDef() do
               begin
                   DataType := ftInteger;
                   Name:= 'FIsSecondHigher';
                   CreateField(RS);
               end;

               RS.Active:=true;
               for i:=0 to LENGTH(R)-1 do
               begin
                    RS.Insert;
                    RS.FieldByName('FId_PersonEducationForm').Value            :=R[i].Id_PersonEducationForm;
                    RS.FieldByName('FId_Qualification').Value                  :=R[i].Id_Qualification;
                    RS.FieldByName('FIsSecondHigher').Value                    :=R[i].IsSecondHigher;

                    RS.FieldByName('FPersonEducationFormName').Value           :=WideStringToString(R[i].PersonEducationFormName, CP_ACP);
                    RS.FieldByName('FUniversityFacultetKode').Value            :=WideStringToString(R[i].UniversityFacultetKode, CP_ACP);
                    RS.FieldByName('FSpecCode').Value                          :=WideStringToString(R[i].SpecCode, CP_ACP);
                    RS.FieldByName('FPersonCodeU').Value                       :=WideStringToString(R[i].PersonCodeU, CP_ACP);
                    RS.FieldByName('FUniversityFacultetFullName').Value        :=WideStringToString(R[i].UniversityFacultetFullName, CP_ACP);
                    RS.FieldByName('FSpecSpecialityName').Value                :=WideStringToString(R[i].SpecSpecialityName, CP_ACP);
                    RS.FieldByName('FQualificationName').Value                 :=WideStringToString(R[i].QualificationName, CP_ACP);
                    RS.FieldByName('FUniversityGroupFullName').Value           :=WideStringToString(R[i].UniversityGroupFullName, CP_ACP);

                    RS.FieldByName('FPersonEducationHistoryOrdersNumber').Value:=WideStringToString(R[i].PersonEducationHistoryOrdersNumber, CP_ACP);
                    RS.FieldByName('FId_UniversityGroup').Value                :=R[i].Id_UniversityGroup;
                    RS.FieldByName('FId_Course').Value                         :=R[i].Id_Course;
                    RS.FieldByName('FId_education').Value                      :=R[i].Id_PersonEducation;
                    RS.FieldByName('FId_PersonRequest').Value                  :=R[i].Id_PersonRequest;
                    RS.FieldByName('FId_PersonEducationHistoryOrders').Value   :=R[i].Id_PersonEducationHistoryOrders;
                    RS.FieldByName('FPersonEducationHistoryOrdersDate').Value  :=R[i].PersonEducationHistoryOrdersDate.AsDateTime;
                    RS.FieldByName('FId_PersonEducationPaymentType').Value     :=R[i].Id_PersonEducationPaymentType;
                    RS.FieldByName('FId_PersonEducationHistoryType').Value     :=R[i].Id_PersonEducationHistoryType;
                    RS.FieldByName('FPersonEducationDateBegin').Value          :=R[i].PersonEducationDateBegin.AsDateTime;
                    RS.FieldByName('FPersonEducationDateEnd').Value            :=R[i].PersonEducationDateEnd.AsDateTime;

                    RS.Post;

                    if @CFunc<>nil then CFunc(i+1, LENGTH(R));
               end
     end;


end;

initialization
     //Регистрация класса в глобальном реестре
     RegisterAppModule(TEDBOIntf,'EDBOIntf');
end.

