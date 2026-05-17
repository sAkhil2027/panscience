# 🚀 Multi Utility RAG Chatbot using LangGraph + FAISS + Streamlit

An advanced Retrieval-Augmented Generation (RAG) chatbot system built using **LangGraph**, **LangChain**, **FAISS**, **OpenRouter LLMs**, and **Streamlit**.

This project allows users to:
- Upload PDFs
- Ask document-based questions
- Perform semantic retrieval
- Use intelligent tools (calculator, stock API, web search)
- Maintain persistent multi-thread conversations
- Stream AI responses in real time

The project demonstrates:
- RAG architecture
- Vector databases
- Tool calling agents
- Stateful AI workflows
- Persistent memory systems
- Multi-session conversational AI

---

# 📌 Features

## ✅ PDF Upload & Retrieval
- Upload PDFs dynamically
- Extracts text using `PyPDFLoader`
- Splits documents into overlapping chunks
- Stores embeddings in FAISS vector database

---

## ✅ Retrieval-Augmented Generation (RAG)
- Semantic similarity search
- Context-aware responses
- Reduced hallucinations
- Retrieval pipeline integrated with LLM

---

## ✅ Multi-Tool AI Agent
Integrated tools include:
- 📖 PDF Retrieval Tool
- 🌐 DuckDuckGo Web Search
- 🧮 Calculator Tool

---

## ✅ Persistent Chat Memory
- SQLite checkpointing
- Multi-thread conversations
- Conversation history restoration

---

## ✅ Streaming Responses
- Real-time token streaming
- ChatGPT-like interaction experience

---

## ✅ Multi-Conversation Management
- Create new chats
- Switch between previous conversations
- Delete conversations permanently

---

# 🏗️ System Architecture

```text
                ┌─────────────────────┐
                │   User Uploads PDF  │
                └──────────┬──────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │  PDF Loader         │
                │  PyPDFLoader        │
                └──────────┬──────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │ Text Chunking       │
                │ Recursive Splitter  │
                └──────────┬──────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │ Embedding Model     │
                │ HuggingFace         │
                └──────────┬──────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │ Vector Database     │
                │ FAISS               │
                └──────────┬──────────┘
                           │
                           ▼
                  User Query
                           │
                           ▼
                ┌─────────────────────┐
                │ Retriever           │
                │ Similarity Search   │
                └──────────┬──────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │ LLM (OpenRouter)    │
                │ GPT-4o-mini         │
                └──────────┬──────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │ AI Response         │
                └─────────────────────┘
```

---

# ⚙️ Tech Stack

| Layer | Technology |
|---|---|
| Frontend | Streamlit |
| Workflow Engine | LangGraph |
| LLM Framework | LangChain |
| LLM Provider | OpenRouter |
| Model | GPT-4o-mini |
| Embeddings | HuggingFace MiniLM |
| Vector Database | FAISS |
| PDF Parsing | PyPDFLoader |
| Chunking | RecursiveCharacterTextSplitter |
| Memory | SQLite |
| APIs | AlphaVantage |
| Search Tool | DuckDuckGo |

---

# 📂 Project Structure

```text
project/
│
├── langgraph_rag_backend.py
├── streamlit_rag_frontend.py
├── requirements.txt
├── Dockerfile
├── .dockerignore
├── .gitignore
├── .env
├── chatbot.db
└── README.md
```

---

# 🔥 How It Works

## Step 1 — Upload PDF
The user uploads a PDF document through the Streamlit interface.

---

## Step 2 — Document Parsing
`PyPDFLoader` extracts text from PDF pages.

---

## Step 3 — Text Chunking
Documents are split using:
- chunk size = 1000
- chunk overlap = 200

This preserves semantic continuity.

---

## Step 4 — Embedding Generation
Chunks are converted into vector embeddings using:

```python
sentence-transformers/all-MiniLM-L6-v2
```

---

## Step 5 — Vector Storage
Embeddings are stored inside a FAISS vector database.

---

## Step 6 — User Query
When the user asks a question:
- query embedding is generated
- similarity search retrieves top relevant chunks

---

## Step 7 — LLM Generation
Retrieved chunks are passed to the LLM through LangGraph workflows to generate grounded responses.

---

# 🧠 LangGraph Workflow

```text
START
   │
   ▼
chat_node
   │
   ├── Tool Needed? ──► ToolNode
   │                        │
   │                        ▼
   └────────────────── chat_node
```

The graph dynamically decides:
- direct response
- or tool execution

---

# 🚀 Installation

## 1. Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git
```

---

## 2. Move into Project Folder

```bash
cd YOUR_REPOSITORY
```

---

## 3. Create Virtual Environment

### Windows

```bash
python -m venv venv
venv\Scripts\activate
```


## 4. Install Dependencies

```bash
pip install -r requirements.txt
```

---

# 🔑 Environment Variables

Create a `.env` file:

```env
OPENROUTER_API_KEY=your_api_key_here
```

Get your API key from:

https://openrouter.ai/

---

# ▶️ Run the Project

```bash
streamlit run streamlit_rag_frontend.py
```

Open browser:

```text
http://localhost:8501
```

---

# 🐳 Docker Setup

## Build Docker Image

```bash
docker build -t rag-chatbot .
```

---

## Run Container

```bash
docker run -p 8501:8501 --env-file .env rag-chatbot
```

---

# 💡 Key Concepts Demonstrated

- Retrieval-Augmented Generation (RAG)
- Vector Similarity Search
- LangGraph State Machines
- Tool Calling Agents
- Semantic Search
- Embeddings
- Stateful Conversational AI
- Persistent Memory Systems
- Streaming LLM Responses

---

# 🎯 Why This Project Matters

This is not just a basic chatbot.

It demonstrates:
- Production-level RAG architecture
- AI agent workflows
- Multi-tool orchestration
- Persistent memory
- Scalable conversational systems

This project is highly relevant for:
- LLM Engineering
- AI Engineering
- Generative AI
- Applied NLP
- Production AI Systems

---

# 👨‍💻 Author

Akhil Vikram Singh

---

# ⭐ If You Like This Project

Please consider giving this repository a ⭐ on GitHub.
