<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>FAQs</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .accordion {
            margin-top: 20px;
        }
        .card {
            border: 1px solid #ccc;
            margin-bottom: 10px;
            border-radius: 5px;
            background-color: #fff;
        }
        .card-header {
            background-color: #f9f9f9;
            padding: 10px;
            cursor: pointer;
            user-select: none;
        }
        .card-header:hover {
            background-color: #ddd;
        }
        .card-header h5 {
            margin: 0;
            font-size: 18px;
        }
        .collapse {
            display: none;
            padding: 10px;
            border-top: 1px solid #ccc;
        }
        .collapse.show {
            display: block;
        }
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var headers = document.querySelectorAll('.card-header');
            headers.forEach(function(header) {
                header.addEventListener('click', function() {
                    var content = this.nextElementSibling;
                    content.classList.toggle('show');
                });
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <h1>Frequently Asked Questions</h1>

        <div class="accordion" id="faqAccordion">
            <c:forEach var="faq" items="${faqs}">
                <div class="card">
                    <div class="card-header" id="heading${faq.id}">
                        <h5 class="mb-0">
                            ${faq.question}
                        </h5>
                    </div>

                    <div id="collapse${faq.id}" class="collapse">
                        <div class="card-body">
                            ${faq.answer}
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
