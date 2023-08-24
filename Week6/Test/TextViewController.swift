//
//  TextViewController.swift
//  Week6
//
//  Created by 박소진 on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {
    
    //1. 인스턴스 생성
    let picker = UIImagePickerController()
    
    let photoImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        view.contentMode = .scaleAspectFill
        return view
    }() //이런 뷰가 여러개면 매번 이름짓기 힘드니까 이름 없는 함수로 만들기
    let titleTextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }() //호출연산자'()' 잊지말자. 이게없으면 연산프로퍼티임
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(photoImageView)
//        view.addSubview(titleTextField)
        
//        for i in [photoImageView, titleTextField] {
//            view.addSubview(i) //반복문
//        }
//
//        //forEach문 위와 같음
//        [photoImageView, titleTextField].forEach { i in //클로저구문
//            view.addSubview(i)
//        }
        
        [photoImageView, titleTextField].forEach { view.addSubview($0) } //위와 같음 (헤더를 달라로)
        
        setupConstraints() //위치는 애드서브뷰 밑으로! 잊지말기
        
        view.backgroundColor = .white

    }
    
    //1-2.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //2. 가능한지 확인 후
//        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { //4.카메라로
//            print("갤러리 사용 불가, 사용자에게 토스트/얼럿") //설정페이지 열어주는 얼럿 등
//            return
//        }
//
//        picker.delegate = self
//        picker.sourceType = .camera//.photoLibrary //어떤 스타일의 뷰를 띄워줄건지 //4-1
//        picker.allowsEditing = true //4-3. 편집기능 허가. 왜 편집된 채로 들어가지 않을까? -> didFinishPickingMediaWithInfo 메소드에서 오리지널 이미지 넣으라고 해놨기 떄문!
        
        let picker = UIFontPickerViewController() //iOS13~14이상. 폰트 선택할 수 있음. 선택하면 뭐할건지 - 딜리게이트
        //let picker =  UIColorPickerViewController() - 북마크기능을 주고싶다, 컬러 주고싶다면..!
        present(picker, animated: true)
        
    }
    
    func setupConstraints() {
        
        photoImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view).multipliedBy(0.3) //뷰랑 같은데, 30% 차지할거야
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20) //텍필의 탑을, 이미지뷰 바텀이랑 똑같이 맞추겠다. 근데 20만큼 밀겠다.
//            make.leadingMargin.equalTo(20)
//            make.trailingMargin.equalTo(-20)
//            make.leading.trailing.equalTo(view).inset(20) //위 두개와 같음
            make.horizontalEdges.equalTo(view).inset(20) //위와 같음
            make.height.equalTo(50)
        }
        
    }
    
}

//3.
extension TextViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //취소 버튼 클릭 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
        print(#function)
    }
    
    //사진을 선택하거나 카메라 촬영 직후 호출
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) { //info(딕셔너리로 관리됨): 사진에 대한 정보가 들어옴
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage { //originalImage 원본사진
            self.photoImageView.image = image
            dismiss(animated: true)
        }
        
    }
    
}
