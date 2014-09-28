unit uImpParams;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uImpParams                                                                 *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Организация интерфейса для ввода параметров импорта.                       *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, DB,
  Halcn6db, uneTypes;

type

  TfmImpParams = class(TForm)

    dlgDBFFileName  : TOpenDialog;

    lblDocFileName  : TLabel;
    lblProvFileName : TLabel;

    edtDocFileName  : TcxButtonEdit;
    edtProvFileName : TcxButtonEdit;

    dstAllDoc       : THalcyonDataSet;
    dstAllProv      : THalcyonDataSet;

    btnOK           : TcxButton;
    btnCancel       : TcxButton;

    procedure btnOKClick                           (Sender: TObject);
    procedure FormShortCut                         (var Msg: TWMKey; var Handled: Boolean);

    procedure edtDocFileNamePropertiesButtonClick  (Sender: TObject; AButtonIndex: Integer);
    procedure edtProvFileNamePropertiesButtonClick (Sender: TObject; AButtonIndex: Integer);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDataModul, uneUtils;

resourcestring

    sMsgErrFieldType         = 'Типы полей НД-источника и приёмника не совпадают!'#13'Продолжить процедуру импорта в аварийном режиме?';
    sMsgErrParamsNotFound    = 'Параметры импорта отсутствуют!';
    sMsgErrFieldsNotFound    = 'Структура файла-источника данных некорректна!';

    sMsgDocFileNotFound      = 'Невозможно выполнить импорт данных,'#13'поскольку файл-источник документов не найден!';
    sMsgProvFileNotFound     = 'Невозможно выполнить импорт данных,'#13'поскольку файл-источник проводок не найден!';

    sMsgErrDocFieldType      = 'Невозможно выполнить импорт документов, поскольку'#13'типы полей НД-источника и приёмника не совпадают!';
    sMsgErrProvFieldType     = 'Невозможно выполнить импорт проводок, поскольку'#13'типы полей НД-источника и приёмника не совпадают!';
    sMsgErrDocFieldNotFound  = 'Невозможно выполнить импорт данных'#13'структура файла-источника документов некорректна!';
    sMsgErrProvFieldNotFound = 'Невозможно выполнить импорт данных'#13'структура файла-источника проводок некорректна!';

{$R *.dfm}

//Получаем путь к DBF-файлу документов
procedure TfmImpParams.edtDocFileNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  dlgDBFFileName.Execute;
  edtDocFileName.Text := dlgDBFFileName.FileName;
end;

//Получаем путь к DBF-файлу проводок
procedure TfmImpParams.edtProvFileNamePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  dlgDBFFileName.Execute;
  edtProvFileName.Text := dlgDBFFileName.FileName;
end;

//Выполняем проверку корректности параметров импорта
procedure TfmImpParams.btnOKClick(Sender: TObject);
var
    ModRes       : Integer;
    DocResult    : TImportCheckError;
    ProvResult   : TImportCheckError;
    DocFileName  : TFileName;
    ProvFileName : TFileName;
begin
    DocFileName  := edtDocFileName.Text;
    ProvFileName := edtProvFileName.Text;

    //Проверяем наличие DBF-файла документов
    if not FileExists( DocFileName )
    then begin
        ModalResult := mrNone;
        MessageBox( Handle, PChar( sMsgDocFileNotFound ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
        Exit;
    end;

    //Проверяем наличие DBF-файла проводок
    if not FileExists( ProvFileName )
    then begin
        ModalResult := mrNone;
        MessageBox( Handle, PChar( sMsgProvFileNotFound ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
        Exit;
    end;

    //Проверяем соответствие полей НД документов и проводок параметрам процедуры импорта
    DocResult  := CheckDBFStructure( dstAllDoc,  DocFileName,  cProcImpDocFields,  [ sMsgErrDocFieldNotFound,  sMsgErrDocFieldType  ], Handle );
    ProvResult := CheckDBFStructure( dstAllProv, ProvFileName, cProcImpProvFields, [ sMsgErrProvFieldNotFound, sMsgErrProvFieldType ], Handle );

    if not( ( DocResult = ectNone ) AND ( ProvResult = ectNone ) )
    then begin

        //Оповещаем пользователя о несоответствии типов полей НД-источника и приёмника
        if ( DocResult = ectFTIcompatible ) OR ( ProvResult = ectFTIcompatible )
        then begin
            ModRes := MessageBox( Handle, PChar( sMsgErrFieldType ), PChar( sMsgCaptionWrn ), MB_YESNO or MB_ICONWARNING );

            //Завершам(продолжаем) импорт(в аварийном режиме)
            if ModRes = ID_NO
            then begin
                ModalResult := mrNone;
                Exit;
            end
            else begin
            end;

        end
        else begin
            ModalResult := mrNone;

            //Оповещаем пользователя о причинах, препятствующих продолжению импорта
            if ( DocResult = ectFNUnknown ) OR ( ProvResult = ectFNUnknown )
            then
                MessageBox( Handle, PChar( sMsgErrFieldsNotFound ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR )
            else
                MessageBox( Handle, PChar( sMsgErrParamsNotFound ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );

            Exit;
        end;

	end;

end;

//Обрабатываем нажатие "горячих" клавиш
procedure TfmImpParams.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  case Msg.CharCode of

    VK_F10    : begin
				  btnOK.Click;
				  Handled := True;
				end;

	VK_ESCAPE : begin
				  btnCancel.Click;
				  Handled := True;
                end;
  end;
end;

end.
