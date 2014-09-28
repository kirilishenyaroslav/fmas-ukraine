unit JO5_Types;

interface
uses Classes,IBase,Controls;

type TJo5AccessResult = record
 ID_User:integer;
 Name_user:string;
 User_Id_Card:integer;
 User_Fio:string;
 User_Password:string;
 DB_Handle:TISC_DB_HANDLE;
 DbPath:string;
end;

type TJo5SysInfo = record
 KodSystem: Integer;
 DefIdRegUch: Int64;
 KodSetup: Integer;
 CurrDate: TDate;
 IdSchTypeObj: Integer;
 SystemName: String[100];
 SetupDate: TDate;
 DefCaseKey: Integer;
 DateFirstImport: TDate;
 LanguageID: Integer;
 id_system:Integer;

{//For changing Global KodSetup
 PERIOD_GHANGE_PROC:procedure(AKodSetup:Integer);}
end;

// Type for turnover list
type TJo5SelectShc = record  //параметры дл€ работы с отображением
 SelDate: TDate;             // оборотной ведомости
 SelKodSetup: Integer;
 IdSchTypeObj: Integer;
 IdRegUch: Int64;
end;

// Type for getting information about corresponding accounts
type TJo5SchKor = record
 IdRegUch: Int64;
 IdSch: Int64;
 SelDate: TDate;
 HasChildren: Boolean;
 SchTitle: String;
//следующий массив содержит дебет и кредит оборота
 Oborots: array[0..1] of extended;
end;

type TJo5Object =  class(TObject)
  DB_Handle:TISC_DB_HANDLE;
  Owner:TComponent;
  id:variant;
  User:TJo5AccessResult;
  Koment:string;
  FormType:string;
  id_system:integer;

end;
type TJo5ObjectSaldo =  class(TJo5Object)
  WhatEdit:string;
  ID_doc :variant;
  id_smeta:variant;
  id_sch  :variant;
  id_sTAT  :variant;
  id_kekv :variant;
  id_saldo:variant;
  id_razd:variant;
  razd_num:string;
  stat_num:string;
  sch_num :string;
  smet_kod:string;
  kekv_kod:string;
  razd_title:string;
  stat_title:string;
  sch_title :string;
  smet_title:string;
  kekv_title:string;
  saldo:Extended;
end;

                                                                                //Art
//type TJo5WorkRemnants =  class(TJo5Object)

//  fmType: string;

//end;


type TArrayInt64 = array of Int64;

type TArrayBoolean = array of Boolean;

type TArrayVariant = array of Variant;

//Ќайденовское

	//ѕеречисл€емый тип дл€ установки различных режимов проведени€ документов через €дро
type TKernelMode = ( kmNone, kmAdd, kmDelete, kmEdit );

	//ѕеречисл€емый тип дл€ установки различных режимов запуска менеджера счетов
type TManegerSchMode = ( mmNone, mmCloseSch, mmOpenSch, mmBlockSch );

	//ѕеречисл€емый тип дл€ расшифровки возвращаемых менеджером счетов результатов
type TManegerSchResult = ( msrError, msrOK );

	//ѕеречисл€емый тип дл€ установки различных режимов закрыти€ (отката) системы
type TSystemMode = ( smOpen, smClose );

	//ѕеречисл€емый тип дл€ определени€ стил€ формы
type TEnm_FormStyle    = ( fsDefault, fsModal, fsMDIChild );

{	//«апись дл€ хранени€ параметров загрузки справочника (Ќайденов)
type TRec_DBFMParams = packed record
	  Owner     : TComponent;
	  Style     : TEnm_FormStyle;
	  DBHandle  : TISC_DB_HANDLE;
	  TRRHandle : TISC_TR_HANDLE;
	end;

	//«апись дл€ хранени€ значений границ периода
type TRec_PeriodBorders = packed record
	  DateBeg : TDate;
	  DateEnd : TDate;
	end;

  //«апись дл€ хранени€ умалчиваемых системных настроек (Ќайденов)
type TRec_SysOptions = packed record
		IdUser         : Int64;
		UsrFIO         : String;
		IsValid        : Boolean;
		UsrLogin       : String;
		UsrPassword    : String;
		KodSystem      : Integer;
		DefRegUch      : Int64;
		DateSetUp      : TDate;
		NameSystem     : String;
		RootTypeObj    : Integer;
    AppHandle      : THandle;
		AppExePath     : String;
		LogFileName    : String;
		ConnectionStr  : String;
		KodCurrPeriod  : Integer;
		DateCurrPeriod : TDate;
    DefCaseKey     : Integer;
	end;

}
implementation

end.
